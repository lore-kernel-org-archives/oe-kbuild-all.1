Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A6C257820
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 12:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757851215; cv=none; b=fzo2guBJpgAzePXklv8tqGD2p1xQ3PGoKkrdRqv3EciLE/E/8uZSkW7FvBKMU2jGiRvutMFFVPH3v/BQ3T1oab82iTlVKzyqMPDujKOZDspB/t8/HRiHmtm+qYStdQHp/xzuAx78dXlYcR0ubUhVCaCOdXKFvslrLCB6YjwQUCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757851215; c=relaxed/simple;
	bh=Q/khpBhsamShcDYBg4MB9xHmxMsxWZwwITglIWO75xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APiXQvTtE14Hefs1GtElrwQexApNk4ZMZr+1+Olw3Vyyb+M2k5PMm00qYzu/nXBewxgy8Pt85Bxfav/lLN5FozrtbgUdDjw2mRJwo0riVK9Zc3ULbJxPAimynEWwihrYeyA7Sj5fhpDKK3UbsTpHRNb6CwvNWrTbSO4c/XpPuWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1cGxNLx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1cGxNLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757851213; x=1789387213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q/khpBhsamShcDYBg4MB9xHmxMsxWZwwITglIWO75xs=;
  b=e1cGxNLxrHbn5qjIApzHdFmNqJALiI24h9ETPrPn9GjYw0t3am7441Pp
   nk1WuJ81tAR+KzDSQgxj3wssiu1sTulxxGtWhvHZZq9yVc9s/au66yw+K
   kSCZgwldkqru8Z3kOUuVpa0lWYbAYHZdHTit3MeHROzDSSrBiAO2uip2f
   dgxCYrziy+/fKOOrtF/9bEL+EBjBT/OjyQEK56XQEbmuFWwow/Jxyy4yn
   C7JBzzz9PmDCr1Khj9hCT1gd5IVHMkJrlO+cC8I17g6dCncqKiN1PONF8
   ndunz1tGFLGbtRsMKorGYWVwA/606Jt3FEVY8fY0lbDwOsd1K0UOkXCWJ
   A==;
X-CSE-ConnectionGUID: LmhkzE5RSWKVYXY0iJmzAg==
X-CSE-MsgGUID: RHZ01lUnTeuuCFLV1H8NlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="59823419"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="59823419"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 05:00:11 -0700
X-CSE-ConnectionGUID: QbH8Hb9qS8mzuO1eJjHrJg==
X-CSE-MsgGUID: XRBMci2rQC+NtI3gwLeabw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="178743631"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 14 Sep 2025 05:00:10 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxlOn-0002NA-0g;
	Sun, 14 Sep 2025 12:00:06 +0000
Date: Sun, 14 Sep 2025 19:59:09 +0800
From: kernel test robot <lkp@intel.com>
To: JiangJianJun <jiangjianjun3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 8/9] scsi: scsi_error: Add a general LUN based
 error handler
Message-ID: <202509141933.GikctXJJ-lkp@intel.com>
References: <20250914104145.2239901-9-jiangjianjun3@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914104145.2239901-9-jiangjianjun3@huawei.com>

Hi JiangJianJun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v6.17-rc5 next-20250912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/JiangJianJun/scsi-scsi_error-Define-framework-for-LUN-based-error-handle/20250914-181340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20250914104145.2239901-9-jiangjianjun3%40huawei.com
patch subject: [RFC PATCH v4 8/9] scsi: scsi_error: Add a general LUN based error handler
config: arc-randconfig-002-20250914 (https://download.01.org/0day-ci/archive/20250914/202509141933.GikctXJJ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509141933.GikctXJJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509141933.GikctXJJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/scsi_error.c: In function 'sdev_eh_work':
>> drivers/scsi/scsi_error.c:2770:20: warning: unused variable 'shost' [-Wunused-variable]
    2770 |  struct Scsi_Host *shost = sdev->host;
         |                    ^~~~~


vim +/shost +2770 drivers/scsi/scsi_error.c

  2753	
  2754	/*
  2755	 * error handle strategy based on LUN, following steps
  2756	 * is applied to recovery error commands in list:
  2757	 *    check sense data
  2758	 *    send start unit
  2759	 *    reset lun
  2760	 * if there are still error commands, it would fallback to
  2761	 * host based error handler for further recovery.
  2762	 */
  2763	static void sdev_eh_work(struct work_struct *work)
  2764	{
  2765		unsigned long flags;
  2766		struct scsi_lun_eh *luneh =
  2767				container_of(work, struct scsi_lun_eh, eh_handle_work);
  2768		struct scsi_device *sdev = luneh->sdev;
  2769		struct scsi_device_eh *eh = sdev->eh;
> 2770		struct Scsi_Host *shost = sdev->host;
  2771		struct scsi_cmnd *scmd, *next;
  2772		LIST_HEAD(eh_work_q);
  2773		LIST_HEAD(eh_done_q);
  2774	
  2775		spin_lock_irqsave(&luneh->eh_lock, flags);
  2776		list_splice_init(&luneh->eh_cmd_q, &eh_work_q);
  2777		spin_unlock_irqrestore(&luneh->eh_lock, flags);
  2778	
  2779		if (scsi_sdev_eh(sdev, &eh_work_q, &eh_done_q))
  2780			goto out_flush_done;
  2781	
  2782		if (!luneh->fallback) {
  2783			list_for_each_entry_safe(scmd, next, &eh_work_q, eh_entry)
  2784				scsi_eh_finish_cmd(scmd, &eh_done_q);
  2785	
  2786			sdev_printk(KERN_INFO, sdev,
  2787				"%s:luneh: Device offlined - not ready after error recovery\n",
  2788				current->comm);
  2789	
  2790			mutex_lock(&sdev->state_mutex);
  2791			scsi_device_set_state(sdev, SDEV_OFFLINE);
  2792			mutex_unlock(&sdev->state_mutex);
  2793	
  2794			goto out_flush_done;
  2795		}
  2796	
  2797		/*
  2798		 * fallback to host based error handler
  2799		 */
  2800		SCSI_LOG_ERROR_RECOVERY(2, sdev_printk(KERN_INFO, sdev,
  2801			"%s:luneh fallback to further recovery\n", current->comm));
  2802		list_for_each_entry_safe(scmd, next, &eh_work_q, eh_entry) {
  2803			list_del_init(&scmd->eh_entry);
  2804			scsi_eh_scmd_add_shost(scmd);
  2805		}
  2806	
  2807		eh->get_sense_done = 1;
  2808		eh->stu_done = 1;
  2809		eh->reset_done = 1;
  2810	
  2811	out_flush_done:
  2812		scsi_eh_flush_done_q(&eh_done_q);
  2813		spin_lock_irqsave(&luneh->eh_lock, flags);
  2814		luneh->eh_num = 0;
  2815		spin_unlock_irqrestore(&luneh->eh_lock, flags);
  2816	}
  2817	static void sdev_eh_add_cmnd(struct scsi_cmnd *scmd)
  2818	{
  2819		unsigned long flags;
  2820		struct scsi_lun_eh *luneh;
  2821		struct scsi_device *sdev = scmd->device;
  2822	
  2823		luneh = scsi_eh_device_priv(sdev->eh);
  2824	
  2825		spin_lock_irqsave(&luneh->eh_lock, flags);
  2826		list_add_tail(&scmd->eh_entry, &luneh->eh_cmd_q);
  2827		luneh->eh_num++;
  2828		spin_unlock_irqrestore(&luneh->eh_lock, flags);
  2829	}
  2830	static bool sdev_eh_is_busy(struct scsi_device *sdev)
  2831	{
  2832		int ret = 0;
  2833		unsigned long flags;
  2834		struct scsi_lun_eh *luneh;
  2835	
  2836		if (!sdev->eh)
  2837			return false;
  2838	
  2839		luneh = scsi_eh_device_priv(sdev->eh);
  2840	
  2841		spin_lock_irqsave(&luneh->eh_lock, flags);
  2842		ret = luneh->eh_num;
  2843		spin_unlock_irqrestore(&luneh->eh_lock, flags);
  2844	
  2845		return ret != 0;
  2846	}
  2847	static void sdev_eh_wakeup(struct scsi_device *sdev)
  2848	{
  2849		unsigned long flags;
  2850		unsigned int nr_error;
  2851		unsigned int nr_busy;
  2852		struct scsi_lun_eh *luneh;
  2853	
  2854		luneh = scsi_eh_device_priv(sdev->eh);
  2855	
  2856		spin_lock_irqsave(&luneh->eh_lock, flags);
  2857		nr_error = luneh->eh_num;
  2858		spin_unlock_irqrestore(&luneh->eh_lock, flags);
  2859	
  2860		nr_busy = scsi_device_busy(sdev);
  2861	
  2862		if (!nr_error || nr_busy != nr_error) {
  2863			SCSI_LOG_ERROR_RECOVERY(5, sdev_printk(KERN_INFO, sdev,
  2864				"%s:luneh: do not wake up, busy/error: %d/%d\n",
  2865				current->comm, nr_busy, nr_error));
  2866			return;
  2867		}
  2868	
  2869		SCSI_LOG_ERROR_RECOVERY(2, sdev_printk(KERN_INFO, sdev,
  2870			"%s:luneh: waking up, busy/error: %d/%d\n",
  2871			current->comm, nr_busy, nr_error));
  2872	
  2873		schedule_work(&luneh->eh_handle_work);
  2874	}
  2875	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
