Content-Type: multipart/mixed; boundary="===============7464901615086691634=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 5/6] drm/vmwgfx: Add basic support for SVGA3
Date: Wed, 05 May 2021 18:10:26 +0800
Message-ID: <202105051851.zfhpTpQn-lkp@intel.com>
In-Reply-To: <20210505035740.286923-6-zackr@vmware.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7464901615086691634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Zack,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master next-20210505]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-=
drm/drm/tegra/for-next drm/drm-next v5.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zack-Rusin/drm-vmwgfx-SVGA=
-v3-and-arm64-support/20210505-120026
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-c003-20210505 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://github.com/0day-ci/linux/commit/4acf63c8eca79f6073ada0994=
b0e2a03c8fcfb71
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zack-Rusin/drm-vmwgfx-SVGA-v3-and-=
arm64-support/20210505-120026
        git checkout 4acf63c8eca79f6073ada0994b0e2a03c8fcfb71
        # save the attached .config to linux build tree
        make W=3D1 W=3D1 ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:477: warning: expecting prototype fo=
r vmw_fifo_commit_flush(). Prototype was for vmw_cmd_commit_flush() instead
   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:492: warning: expecting prototype fo=
r vmw_fifo_flush(). Prototype was for vmw_cmd_flush() instead
>> drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:650: warning: expecting prototype fo=
r vmw_cmd_emit_dummy_gb_query(). Prototype was for vmw_cmd_emit_dummy_query=
() instead
   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:667: warning: Function parameter or =
member 'vmw' not described in 'vmw_cmd_supported'
   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:667: warning: Excess function parame=
ter 'dev_priv' description in 'vmw_cmd_supported'


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:674:25-26: WARNING comparing pointer=
 to 0

Please review and possibly fold the followup patch.

vim +650 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c

3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  468  =

3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  469  =

3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  470  /**
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  471   * vmw_fifo_commit_flush - Commit fifo space and flush any buff=
ered commands.
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  472   *
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  473   * @dev_priv: Pointer to device private structure.
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  474   * @bytes: Number of bytes to commit.
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  475   */
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-=
11-18  476  void vmw_cmd_commit_flush(struct vmw_private *dev_priv, uint32_=
t bytes)
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25 @477  {
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  478  	if (dev_priv->cman)
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  479  		vmw_cmdbuf_commit(dev_priv->cman, bytes, NULL, true);
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  480  	else
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  481  		vmw_local_fifo_commit(dev_priv, bytes);
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  482  }
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  483  =

3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  484  /**
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  485   * vmw_fifo_flush - Flush any buffered commands and make sure c=
ommand processing
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  486   * starts.
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  487   *
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  488   * @dev_priv: Pointer to device private structure.
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  489   * @interruptible: Whether to wait interruptible if function ne=
eds to sleep.
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  490   */
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-=
11-18  491  int vmw_cmd_flush(struct vmw_private *dev_priv, bool interrupti=
ble)
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  492  {
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  493  	might_sleep();
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  494  =

3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  495  	if (dev_priv->cman)
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  496  		return vmw_cmdbuf_cur_flush(dev_priv->cman, interruptible);
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  497  	else
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  498  		return 0;
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  499  }
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-25  500  =

8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-=
11-18  501  int vmw_cmd_send_fence(struct vmw_private *dev_priv, uint32_t *=
seqno)
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  502  {
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  503  	struct svga_fifo_cmd_fence *cmd_fence;
b9eb1a6174e58e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
04-02  504  	u32 *fm;
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  505  	int ret =3D 0;
b9eb1a6174e58e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
04-02  506  	uint32_t bytes =3D sizeof(u32) + sizeof(*cmd_fence);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  507  =

8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-=
11-18  508  	fm =3D VMW_CMD_RESERVE(dev_priv, bytes);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  509  	if (unlikely(fm =3D=3D NULL)) {
6bcd8d3c782b7b drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
09-01  510  		*seqno =3D atomic_read(&dev_priv->marker_seq);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  511  		ret =3D -ENOMEM;
6bcd8d3c782b7b drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
09-01  512  		(void)vmw_fallback_wait(dev_priv, false, true, *seqno,
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  513  					false, 3*HZ);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  514  		goto out_err;
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  515  	}
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  516  =

fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  517  	do {
6bcd8d3c782b7b drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
09-01  518  		*seqno =3D atomic_add_return(1, &dev_priv->marker_seq);
6bcd8d3c782b7b drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
09-01  519  	} while (*seqno =3D=3D 0);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  520  =

4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  521  	if (!(vmw_fifo_caps(dev_priv) & SVGA_FIFO_CAP_FENCE)) {
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  522  =

fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  523  		/*
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  524  		 * Don't request hardware to send a fence. The
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  525  		 * waiting code in vmwgfx_irq.c will emulate this.
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  526  		 */
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  527  =

8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-=
11-18  528  		vmw_cmd_commit(dev_priv, 0);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  529  		return 0;
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  530  	}
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  531  =

b9eb1a6174e58e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
04-02  532  	*fm++ =3D SVGA_CMD_FENCE;
b9eb1a6174e58e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
04-02  533  	cmd_fence =3D (struct svga_fifo_cmd_fence *) fm;
b9eb1a6174e58e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
04-02  534  	cmd_fence->fence =3D *seqno;
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-=
11-18  535  	vmw_cmd_commit_flush(dev_priv, bytes);
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  536  	vmw_update_seqno(dev_priv);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  537  =

fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  538  out_err:
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  539  	return ret;
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-=
12-10  540  }
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  541  =

e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  542  /**
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  543   * vmw_cmd_emit_dummy_legacy_query - emits a dummy query to the=
 fifo using
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  544   * legacy query commands.
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  545   *
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  546   * @dev_priv: The device private structure.
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  547   * @cid: The hardware context id used for the query.
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  548   *
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  549   * See the vmw_cmd_emit_dummy_query documentation.
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  550   */
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  551  static int vmw_cmd_emit_dummy_legacy_query(struct vmw_private *=
dev_priv,
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  552  					    uint32_t cid)
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  553  {
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  554  	/*
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  555  	 * A query wait without a preceding query end will
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  556  	 * actually finish all queries for this cid
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  557  	 * without writing to the query result structure.
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  558  	 */
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  559  =

459d0fa7359654 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-26  560  	struct ttm_buffer_object *bo =3D &dev_priv->dummy_query_bo->ba=
se;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  561  	struct {
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  562  		SVGA3dCmdHeader header;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  563  		SVGA3dCmdWaitForQuery body;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  564  	} *cmd;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  565  =

8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-=
11-18  566  	cmd =3D VMW_CMD_RESERVE(dev_priv, sizeof(*cmd));
11c454196610ae drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Deepak Rawat      2019-=
02-14  567  	if (unlikely(cmd =3D=3D NULL))
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  568  		return -ENOMEM;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  569  =

e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  570  	cmd->header.id =3D SVGA_3D_CMD_WAIT_FOR_QUERY;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  571  	cmd->header.size =3D sizeof(cmd->body);
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  572  	cmd->body.cid =3D cid;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  573  	cmd->body.type =3D SVGA3D_QUERYTYPE_OCCLUSION;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  574  =

e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  575  	if (bo->mem.mem_type =3D=3D TTM_PL_VRAM) {
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  576  		cmd->body.guestResult.gmrId =3D SVGA_GMR_FRAMEBUFFER;
0b17fc08e396d0 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Nirmoy Das        2020-=
06-24  577  		cmd->body.guestResult.offset =3D bo->mem.start << PAGE_SHIFT;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  578  	} else {
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  579  		cmd->body.guestResult.gmrId =3D bo->mem.start;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  580  		cmd->body.guestResult.offset =3D 0;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  581  	}
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  582  =

8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-=
11-18  583  	vmw_cmd_commit(dev_priv, sizeof(*cmd));
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  584  =

e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  585  	return 0;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-=
10-04  586  }
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  587  =

ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  588  /**
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  589   * vmw_cmd_emit_dummy_gb_query - emits a dummy query to the fif=
o using
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  590   * guest-backed resource query commands.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  591   *
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  592   * @dev_priv: The device private structure.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  593   * @cid: The hardware context id used for the query.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  594   *
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  595   * See the vmw_cmd_emit_dummy_query documentation.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  596   */
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  597  static int vmw_cmd_emit_dummy_gb_query(struct vmw_private *dev_=
priv,
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  598  				       uint32_t cid)
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  599  {
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  600  	/*
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  601  	 * A query wait without a preceding query end will
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  602  	 * actually finish all queries for this cid
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  603  	 * without writing to the query result structure.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  604  	 */
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  605  =

459d0fa7359654 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-=
06-26  606  	struct ttm_buffer_object *bo =3D &dev_priv->dummy_query_bo->ba=
se;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  607  	struct {
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  608  		SVGA3dCmdHeader header;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  609  		SVGA3dCmdWaitForGBQuery body;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  610  	} *cmd;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  611  =

8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-=
11-18  612  	cmd =3D VMW_CMD_RESERVE(dev_priv, sizeof(*cmd));
11c454196610ae drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Deepak Rawat      2019-=
02-14  613  	if (unlikely(cmd =3D=3D NULL))
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  614  		return -ENOMEM;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  615  =

ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  616  	cmd->header.id =3D SVGA_3D_CMD_WAIT_FOR_GB_QUERY;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  617  	cmd->header.size =3D sizeof(cmd->body);
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  618  	cmd->body.cid =3D cid;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  619  	cmd->body.type =3D SVGA3D_QUERYTYPE_OCCLUSION;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  620  	BUG_ON(bo->mem.mem_type !=3D VMW_PL_MOB);
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  621  	cmd->body.mobid =3D bo->mem.start;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  622  	cmd->body.offset =3D 0;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  623  =

8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-=
11-18  624  	vmw_cmd_commit(dev_priv, sizeof(*cmd));
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  625  =

ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  626  	return 0;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  627  }
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  628  =

ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  629  =

ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  630  /**
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  631   * vmw_cmd_emit_dummy_gb_query - emits a dummy query to the fif=
o using
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  632   * appropriate resource query commands.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  633   *
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  634   * @dev_priv: The device private structure.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  635   * @cid: The hardware context id used for the query.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  636   *
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  637   * This function is used to emit a dummy occlusion query with
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  638   * no primitives rendered between query begin and query end.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  639   * It's used to provide a query barrier, in order to know that =
when
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  640   * this query is finished, all preceding queries are also finis=
hed.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  641   *
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  642   * A Query results structure should have been initialized at th=
e start
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  643   * of the dev_priv->dummy_query_bo buffer object. And that buff=
er object
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  644   * must also be either reserved or pinned when this function is=
 called.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  645   *
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  646   * Returns -ENOMEM on failure to reserve fifo space.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  647   */
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-=
11-18  648  int vmw_cmd_emit_dummy_query(struct vmw_private *dev_priv,
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  649  			      uint32_t cid)
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21 @650  {
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  651  	if (dev_priv->has_mob)
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  652  		return vmw_cmd_emit_dummy_gb_query(dev_priv, cid);
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  653  =

4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  654  	return vmw_cmd_emit_dummy_legacy_query(dev_priv, cid);
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  655  }
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  656  =

ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-=
11-21  657  =

4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  658  /**
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  659   * vmw_cmd_supported - returns true if the given device supports
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  660   * command queues.
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  661   *
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  662   * @dev_priv: The device private structure.
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  663   *
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  664   * Returns true if we can issue commands.
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  665   */
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  666  bool vmw_cmd_supported(struct vmw_private *vmw)
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  667  {
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  668  	if ((vmw->capabilities & (SVGA_CAP_COMMAND_BUFFERS |
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  669  				  SVGA_CAP_CMD_BUFFERS_2)) !=3D 0)
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  670  		return true;
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  671  	/*
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  672  	 * We have FIFO cmd's
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04  673  	 */
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-=
05-04 @674  	return vmw->fifo_mem !=3D 0;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7464901615086691634==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7464901615086691634==--

