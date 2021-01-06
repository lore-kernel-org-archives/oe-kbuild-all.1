Content-Type: multipart/mixed; boundary="===============8029204241139706619=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] scsi: ufs: handle LINERESET with correct tm_cmd
Date: Thu, 07 Jan 2021 05:09:39 +0800
Message-ID: <202101070535.QkOU22yl-lkp@intel.com>
In-Reply-To: <20210106193649.3348230-2-jaegeuk@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8029204241139706619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jaegeuk,

I love your patch! Perhaps something to improve:

[auto build test WARNING on scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v5.11-rc2 next-2=
0210104]
[cannot apply to linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jaegeuk-Kim/scsi-ufs-fix-l=
ivelock-of-ufshcd_clear_ua_wluns/20210107-034119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-n=
ext
config: nds32-randconfig-r012-20210106 (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/1ae2226bbc3a8096dfceaab9c=
598f02d387915ba
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jaegeuk-Kim/scsi-ufs-fix-livelock-=
of-ufshcd_clear_ua_wluns/20210107-034119
        git checkout 1ae2226bbc3a8096dfceaab9c598f02d387915ba
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dnds32 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/async.h:14,
                    from drivers/scsi/ufs/ufshcd.c:12:
   drivers/scsi/ufs/ufshcd.c: In function 'ufshcd_err_handler':
>> drivers/scsi/ufs/ufshcd.c:5922:23: warning: format '%x' expects argument=
 of type 'unsigned int', but argument 4 has type 'long unsigned int' [-Wfor=
mat=3D]
    5922 |     dev_err(hba->dev, "%s: timeout, outstanding=3D%x\n",
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/scsi/ufs/ufshcd.c:5922:5: note: in expansion of macro 'dev_err'
    5922 |     dev_err(hba->dev, "%s: timeout, outstanding=3D%x\n",
         |     ^~~~~~~
   drivers/scsi/ufs/ufshcd.c:5922:50: note: format string is defined here
    5922 |     dev_err(hba->dev, "%s: timeout, outstanding=3D%x\n",
         |                                                 ~^
         |                                                  |
         |                                                  unsigned int
         |                                                 %lx


vim +5922 drivers/scsi/ufs/ufshcd.c

  5818	=

  5819	/**
  5820	 * ufshcd_err_handler - handle UFS errors that require s/w attention
  5821	 * @work: pointer to work structure
  5822	 */
  5823	static void ufshcd_err_handler(struct work_struct *work)
  5824	{
  5825		struct ufs_hba *hba;
  5826		unsigned long flags;
  5827		bool err_xfer =3D false;
  5828		bool err_tm =3D false;
  5829		int err =3D 0, pmc_err;
  5830		int tag;
  5831		bool needs_reset =3D false, needs_restore =3D false;
  5832	=

  5833		hba =3D container_of(work, struct ufs_hba, eh_work);
  5834	=

  5835		down(&hba->eh_sem);
  5836		spin_lock_irqsave(hba->host->host_lock, flags);
  5837		if (ufshcd_err_handling_should_stop(hba)) {
  5838			if (hba->ufshcd_state !=3D UFSHCD_STATE_ERROR)
  5839				hba->ufshcd_state =3D UFSHCD_STATE_OPERATIONAL;
  5840			spin_unlock_irqrestore(hba->host->host_lock, flags);
  5841			up(&hba->eh_sem);
  5842			return;
  5843		}
  5844		ufshcd_set_eh_in_progress(hba);
  5845		spin_unlock_irqrestore(hba->host->host_lock, flags);
  5846		ufshcd_err_handling_prepare(hba);
  5847		spin_lock_irqsave(hba->host->host_lock, flags);
  5848		ufshcd_scsi_block_requests(hba);
  5849		hba->ufshcd_state =3D UFSHCD_STATE_RESET;
  5850	=

  5851		/* Complete requests that have door-bell cleared by h/w */
  5852		ufshcd_complete_requests(hba);
  5853	=

  5854		/*
  5855		 * A full reset and restore might have happened after preparation
  5856		 * is finished, double check whether we should stop.
  5857		 */
  5858		if (ufshcd_err_handling_should_stop(hba))
  5859			goto skip_err_handling;
  5860	=

  5861		if (hba->dev_quirks & UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS)=
 {
  5862			bool ret;
  5863	=

  5864			spin_unlock_irqrestore(hba->host->host_lock, flags);
  5865			/* release the lock as ufshcd_quirk_dl_nac_errors() may sleep */
  5866			ret =3D ufshcd_quirk_dl_nac_errors(hba);
  5867			spin_lock_irqsave(hba->host->host_lock, flags);
  5868			if (!ret && ufshcd_err_handling_should_stop(hba))
  5869				goto skip_err_handling;
  5870		}
  5871	=

  5872		if ((hba->saved_err & (INT_FATAL_ERRORS | UFSHCD_UIC_HIBERN8_MASK))=
 ||
  5873		    (hba->saved_uic_err &&
  5874		     (hba->saved_uic_err !=3D UFSHCD_UIC_PA_GENERIC_ERROR))) {
  5875			bool pr_prdt =3D !!(hba->saved_err & SYSTEM_BUS_FATAL_ERROR);
  5876	=

  5877			spin_unlock_irqrestore(hba->host->host_lock, flags);
  5878			ufshcd_print_host_state(hba);
  5879			ufshcd_print_pwr_info(hba);
  5880			ufshcd_print_evt_hist(hba);
  5881			ufshcd_print_tmrs(hba, hba->outstanding_tasks);
  5882			ufshcd_print_trs(hba, hba->outstanding_reqs, pr_prdt);
  5883			spin_lock_irqsave(hba->host->host_lock, flags);
  5884		}
  5885	=

  5886		/*
  5887		 * if host reset is required then skip clearing the pending
  5888		 * transfers forcefully because they will get cleared during
  5889		 * host reset and restore
  5890		 */
  5891		if (hba->force_reset || ufshcd_is_link_broken(hba) ||
  5892		    ufshcd_is_saved_err_fatal(hba) ||
  5893		    ((hba->saved_err & UIC_ERROR) &&
  5894		     (hba->saved_uic_err & (UFSHCD_UIC_DL_NAC_RECEIVED_ERROR |
  5895					    UFSHCD_UIC_DL_TCx_REPLAY_ERROR)))) {
  5896			needs_reset =3D true;
  5897			goto do_reset;
  5898		}
  5899	=

  5900		/*
  5901		 * If LINERESET was caught, UFS might have been put to PWM mode,
  5902		 * check if power mode restore is needed.
  5903		 */
  5904		if (hba->saved_uic_err & UFSHCD_UIC_PA_GENERIC_ERROR) {
  5905			ktime_t start =3D ktime_get();
  5906	=

  5907			hba->saved_uic_err &=3D ~UFSHCD_UIC_PA_GENERIC_ERROR;
  5908			if (!hba->saved_uic_err)
  5909				hba->saved_err &=3D ~UIC_ERROR;
  5910			spin_unlock_irqrestore(hba->host->host_lock, flags);
  5911			if (ufshcd_is_pwr_mode_restore_needed(hba))
  5912				needs_restore =3D true;
  5913			spin_lock_irqsave(hba->host->host_lock, flags);
  5914			/* Wait for IO completion to avoid aborting IOs */
  5915			while (hba->outstanding_reqs) {
  5916				ufshcd_complete_requests(hba);
  5917				spin_unlock_irqrestore(hba->host->host_lock, flags);
  5918				schedule();
  5919				spin_lock_irqsave(hba->host->host_lock, flags);
  5920				if (ktime_to_ms(ktime_sub(ktime_get(), start)) >
  5921							LINERESET_IO_TIMEOUT_MS) {
> 5922					dev_err(hba->dev, "%s: timeout, outstanding=3D%x\n",
  5923						__func__, hba->outstanding_reqs);
  5924					break;
  5925				}
  5926			}
  5927	=

  5928			if (!hba->saved_err && !needs_restore)
  5929				goto skip_err_handling;
  5930		}
  5931	=

  5932		hba->silence_err_logs =3D true;
  5933		/* release lock as clear command might sleep */
  5934		spin_unlock_irqrestore(hba->host->host_lock, flags);
  5935		/* Clear pending transfer requests */
  5936		for_each_set_bit(tag, &hba->outstanding_reqs, hba->nutrs) {
  5937			if (ufshcd_try_to_abort_task(hba, tag)) {
  5938				err_xfer =3D true;
  5939				goto lock_skip_pending_xfer_clear;
  5940			}
  5941		}
  5942	=

  5943		/* Clear pending task management requests */
  5944		for_each_set_bit(tag, &hba->outstanding_tasks, hba->nutmrs) {
  5945			if (ufshcd_clear_tm_cmd(hba, tag)) {
  5946				err_tm =3D true;
  5947				goto lock_skip_pending_xfer_clear;
  5948			}
  5949		}
  5950	=

  5951	lock_skip_pending_xfer_clear:
  5952		spin_lock_irqsave(hba->host->host_lock, flags);
  5953	=

  5954		/* Complete the requests that are cleared by s/w */
  5955		ufshcd_complete_requests(hba);
  5956		hba->silence_err_logs =3D false;
  5957	=

  5958		if (err_xfer || err_tm) {
  5959			needs_reset =3D true;
  5960			goto do_reset;
  5961		}
  5962	=

  5963		/*
  5964		 * After all reqs and tasks are cleared from doorbell,
  5965		 * now it is safe to retore power mode.
  5966		 */
  5967		if (needs_restore) {
  5968			spin_unlock_irqrestore(hba->host->host_lock, flags);
  5969			/*
  5970			 * Hold the scaling lock just in case dev cmds
  5971			 * are sent via bsg and/or sysfs.
  5972			 */
  5973			down_write(&hba->clk_scaling_lock);
  5974			hba->force_pmc =3D true;
  5975			pmc_err =3D ufshcd_config_pwr_mode(hba, &(hba->pwr_info));
  5976			if (pmc_err) {
  5977				needs_reset =3D true;
  5978				dev_err(hba->dev, "%s: Failed to restore power mode, err =3D %d\n=
",
  5979						__func__, pmc_err);
  5980			}
  5981			hba->force_pmc =3D false;
  5982			ufshcd_print_pwr_info(hba);
  5983			up_write(&hba->clk_scaling_lock);
  5984			spin_lock_irqsave(hba->host->host_lock, flags);
  5985		}
  5986	=

  5987	do_reset:
  5988		/* Fatal errors need reset */
  5989		if (needs_reset) {
  5990			unsigned long max_doorbells =3D (1UL << hba->nutrs) - 1;
  5991	=

  5992			/*
  5993			 * ufshcd_reset_and_restore() does the link reinitialization
  5994			 * which will need atleast one empty doorbell slot to send the
  5995			 * device management commands (NOP and query commands).
  5996			 * If there is no slot empty at this moment then free up last
  5997			 * slot forcefully.
  5998			 */
  5999			if (hba->outstanding_reqs =3D=3D max_doorbells)
  6000				__ufshcd_transfer_req_compl(hba,
  6001							    (1UL << (hba->nutrs - 1)));
  6002	=

  6003			hba->force_reset =3D false;
  6004			spin_unlock_irqrestore(hba->host->host_lock, flags);
  6005			err =3D ufshcd_reset_and_restore(hba);
  6006			if (err)
  6007				dev_err(hba->dev, "%s: reset and restore failed with err %d\n",
  6008						__func__, err);
  6009			else
  6010				ufshcd_recover_pm_error(hba);
  6011			spin_lock_irqsave(hba->host->host_lock, flags);
  6012		}
  6013	=

  6014	skip_err_handling:
  6015		if (!needs_reset) {
  6016			if (hba->ufshcd_state =3D=3D UFSHCD_STATE_RESET)
  6017				hba->ufshcd_state =3D UFSHCD_STATE_OPERATIONAL;
  6018			if (hba->saved_err || hba->saved_uic_err)
  6019				dev_err_ratelimited(hba->dev, "%s: exit: saved_err 0x%x saved_uic=
_err 0x%x",
  6020				    __func__, hba->saved_err, hba->saved_uic_err);
  6021		}
  6022		ufshcd_clear_eh_in_progress(hba);
  6023		spin_unlock_irqrestore(hba->host->host_lock, flags);
  6024		ufshcd_scsi_unblock_requests(hba);
  6025		ufshcd_err_handling_unprepare(hba);
  6026		up(&hba->eh_sem);
  6027	=

  6028		if (!err && needs_reset)
  6029			ufshcd_clear_ua_wluns(hba);
  6030	}
  6031	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8029204241139706619==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8029204241139706619==--

