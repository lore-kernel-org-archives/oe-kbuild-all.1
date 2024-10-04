Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A5D17547
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 02:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728007923; cv=none; b=eenKb8SWZvMFkcDqUMYN6fJ6YrCuNV/yLCpHNzTiEORsl2Z0bX357+plwvKCFLYOU1bWcTVo0IXqaT8sad0KAC+YvdZVOy6pSmMAkG1AOe4hM6LYDtGhj15O0aZPYUzybe/B1VVAzm4PDge0zTZwfW5N7ktt/3Kc5k5OlGg1/zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728007923; c=relaxed/simple;
	bh=YlsUKzO3o90nWOCvzhwyZ9XGe/tI5NVI3CxZ9chdgVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LsjiBFuDuTU8Yzkf4nKZL0TDWiKIwaS+OBZrr43ixQlA5oBc6ZJVhMI3B4g0cl/koH2VRAqB2nIbLghxA5iYKHx7gUmEuRAcdIs+kGrJH9tPXemkl3PfQlhiFwOPcRuu01ICHUkLlNDE58amVCWpYFhHYvf806IiKU0WTl7C6Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBtZr47r; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBtZr47r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728007921; x=1759543921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YlsUKzO3o90nWOCvzhwyZ9XGe/tI5NVI3CxZ9chdgVM=;
  b=fBtZr47rESlaWzyOk4G3cwQg+rFUiSkFc3vWdUFNcYMIuvgb2oqiTvQR
   bzlk0vyUkqMifHRuoq6oth2ImUj8RaJYwlRe/DX1aQjLwOd12CS/kekO+
   y+agcjoFNEpCBzDrEXDfce60WjL+27wfueHiu4Fl8X7bqlP+1TpmJjeo8
   6BJUJoS06DmtfK3HAaFj65Xpvd82Cj5YgJzdq1g1YuNeP+m3Re6D+49St
   FGIORuj/3rygZsIaklDEy0mzFC0SMx1EeCcu87ypECZb1YjWw5hOP1iRv
   0V3h8CU8q8qpwtuHC1ZM57MvLNzp4ucszGlJQ7lPLTpvI1U8AIpDJis70
   g==;
X-CSE-ConnectionGUID: vieaM2w4SSGB3mb5bprv2A==
X-CSE-MsgGUID: Lg+41YJySVODL4IpBbF4Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27169952"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="27169952"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 19:12:01 -0700
X-CSE-ConnectionGUID: S70iKUGmTx2tTGMXox8WQQ==
X-CSE-MsgGUID: 3Y/D74MeQMa6Fw+93WFVaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="79406714"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Oct 2024 19:12:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swXnR-000180-0C;
	Fri, 04 Oct 2024 02:11:57 +0000
Date: Fri, 4 Oct 2024 10:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 6289/23811]
 drivers/scsi/hisi_sas/hisi_sas_main.c:2888:9: sparse: sparse: symbol
 'hisi_sas_debugfs_bist_linkrate_write' was not declared. Should it be
 static?
Message-ID: <202410041051.A286AcSf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 7add7cc0243793dca7bdeeb53c37212a87076c69 [6289/23811] hisi_sas: add the bist loopback feature.
config: arm64-randconfig-r111-20241003 (https://download.01.org/0day-ci/archive/20241004/202410041051.A286AcSf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241004/202410041051.A286AcSf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041051.A286AcSf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/hisi_sas/hisi_sas_main.c:1660:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed @@     got restricted __le16 [usertype] @@
   drivers/scsi/hisi_sas/hisi_sas_main.c:1660:52: sparse:     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed
   drivers/scsi/hisi_sas/hisi_sas_main.c:1660:52: sparse:     got restricted __le16 [usertype]
   drivers/scsi/hisi_sas/hisi_sas_main.c:1917:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed @@     got restricted __le16 [usertype] @@
   drivers/scsi/hisi_sas/hisi_sas_main.c:1917:52: sparse:     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed
   drivers/scsi/hisi_sas/hisi_sas_main.c:1917:52: sparse:     got restricted __le16 [usertype]
   drivers/scsi/hisi_sas/hisi_sas_main.c:2800:12: sparse: sparse: symbol 'hisi_sas_debugfs_to_reg_name' was not declared. Should it be static?
   drivers/scsi/hisi_sas/hisi_sas_main.c:2827:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2827:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2827:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2827:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2827:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2827:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2830:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2830:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2830:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2830:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2830:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2830:36: sparse: sparse: cast to restricted __le32
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2888:9: sparse: sparse: symbol 'hisi_sas_debugfs_bist_linkrate_write' was not declared. Should it be static?
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2979:9: sparse: sparse: symbol 'hisi_sas_debugfs_bist_code_mode_write' was not declared. Should it be static?
>> drivers/scsi/hisi_sas/hisi_sas_main.c:3034:9: sparse: sparse: symbol 'hisi_sas_debugfs_bist_phy_write' was not declared. Should it be static?
>> drivers/scsi/hisi_sas/hisi_sas_main.c:3120:9: sparse: sparse: symbol 'hisi_sas_debugfs_bist_mode_write' was not declared. Should it be static?
>> drivers/scsi/hisi_sas/hisi_sas_main.c:3174:9: sparse: sparse: symbol 'hisi_sas_debugfs_bist_enable_write' was not declared. Should it be static?
   drivers/scsi/hisi_sas/hisi_sas_main.c:3277:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:3277:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:3277:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:3277:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:3277:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:3277:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:3277:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:3277:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:3277:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:3277:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:3296:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:3296:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:3296:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:3296:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:3296:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:3296:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2801:1: warning: no previous prototype for 'hisi_sas_debugfs_to_reg_name' [-Wmissing-prototypes]
    2801 | hisi_sas_debugfs_to_reg_name(int off, int base_off,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_main.c:2888:9: warning: no previous prototype for 'hisi_sas_debugfs_bist_linkrate_write' [-Wmissing-prototypes]
    2888 | ssize_t hisi_sas_debugfs_bist_linkrate_write(struct file *filp,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_main.c:2979:9: warning: no previous prototype for 'hisi_sas_debugfs_bist_code_mode_write' [-Wmissing-prototypes]
    2979 | ssize_t hisi_sas_debugfs_bist_code_mode_write(struct file *filp,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_main.c:3034:9: warning: no previous prototype for 'hisi_sas_debugfs_bist_phy_write' [-Wmissing-prototypes]
    3034 | ssize_t hisi_sas_debugfs_bist_phy_write(struct file *filp,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_main.c:3120:9: warning: no previous prototype for 'hisi_sas_debugfs_bist_mode_write' [-Wmissing-prototypes]
    3120 | ssize_t hisi_sas_debugfs_bist_mode_write(struct file *filp,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_main.c:3174:9: warning: no previous prototype for 'hisi_sas_debugfs_bist_enable_write' [-Wmissing-prototypes]
    3174 | ssize_t hisi_sas_debugfs_bist_enable_write(struct file *filp,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/scsi/libsas.h:36,
                    from include/scsi/sas_ata.h:29,
                    from drivers/scsi/hisi_sas/hisi_sas.h:29,
                    from drivers/scsi/hisi_sas/hisi_sas_main.c:12:
   In function 'scsi_prot_sglist',
       inlined from 'hisi_sas_dif_dma_map' at drivers/scsi/hisi_sas/hisi_sas_main.c:448:2:
   include/scsi/scsi_cmnd.h:333:19: warning: 'scsi_cmnd' may be used uninitialized [-Wmaybe-uninitialized]
     333 |         return cmd->prot_sdb ? cmd->prot_sdb->table.sgl : NULL;
         |                ~~~^~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_main.c: In function 'hisi_sas_dif_dma_map':
   drivers/scsi/hisi_sas/hisi_sas_main.c:418:27: note: 'scsi_cmnd' was declared here
     418 |         struct scsi_cmnd *scsi_cmnd;
         |                           ^~~~~~~~~
   In file included from include/asm-generic/preempt.h:5,
                    from ./arch/arm64/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:81,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:9,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/resource_ext.h:19,
                    from include/linux/acpi.h:26,
                    from drivers/scsi/hisi_sas/hisi_sas.h:15:
   In function 'check_object_size',
       inlined from 'check_copy_size' at include/linux/thread_info.h:150:2,
       inlined from 'copy_from_user' at include/linux/uaccess.h:143:6,
       inlined from 'hisi_sas_debugfs_trigger_dump_write' at drivers/scsi/hisi_sas/hisi_sas_main.c:3550:6:
   include/linux/thread_info.h:119:17: warning: 'buf' may be used uninitialized [-Wmaybe-uninitialized]
     119 |                 __check_object_size(ptr, n, to_user);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h: In function 'hisi_sas_debugfs_trigger_dump_write':
   include/linux/thread_info.h:112:13: note: by argument 1 of type 'const void *' to '__check_object_size' declared here
     112 | extern void __check_object_size(const void *ptr, unsigned long n,
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_main.c:3537:12: note: 'buf' declared here
    3537 |         u8 buf[8];
         |            ^~~

vim +/hisi_sas_debugfs_bist_linkrate_write +2888 drivers/scsi/hisi_sas/hisi_sas_main.c

  2887	
> 2888	ssize_t hisi_sas_debugfs_bist_linkrate_write(struct file *filp,
  2889						 const char __user *buf,
  2890						 size_t count, loff_t *ppos)
  2891	{
  2892		struct seq_file *m = filp->private_data;
  2893		struct hisi_hba *hisi_hba = m->private;
  2894		char kbuf[16] = {}, *pkbuf;
  2895		bool found = false;
  2896		int i;
  2897	
  2898		if (hisi_hba->bist_loopback_enable)
  2899			return -EINVAL;
  2900	
  2901		if (count >= sizeof(kbuf))
  2902			return -EINVAL;
  2903	
  2904		if (copy_from_user(kbuf, buf, count))
  2905			return -EINVAL;
  2906	
  2907		pkbuf = strstrip(kbuf);
  2908	
  2909		for (i = 0; i < ARRAY_SIZE(hisi_sas_debugfs_loop_linkrate); i++) {
  2910			if (!strncmp(hisi_sas_debugfs_loop_linkrate[i].name,
  2911				pkbuf, 16)) {
  2912				hisi_hba->bist_loopback_linkrate =
  2913					hisi_sas_debugfs_loop_linkrate[i].value;
  2914				found = true;
  2915				break;
  2916			}
  2917		}
  2918	
  2919		if (!found) {
  2920			dev_err(hisi_hba->dev, "unknown mode\n");
  2921			return -EINVAL;
  2922		}
  2923	
  2924		return count;
  2925	}
  2926	
  2927	static int hisi_sas_debugfs_bist_linkrate_open(struct inode *inode,
  2928						   struct file *filp)
  2929	{
  2930		return single_open(filp, hisi_sas_debugfs_bist_linkrate_show,
  2931				   inode->i_private);
  2932	}
  2933	
  2934	static const struct file_operations hisi_sas_debugfs_bist_linkrate_ops = {
  2935		.open = hisi_sas_debugfs_bist_linkrate_open,
  2936		.read = seq_read,
  2937		.write = hisi_sas_debugfs_bist_linkrate_write,
  2938		.llseek = seq_lseek,
  2939		.release = single_release,
  2940		.owner = THIS_MODULE,
  2941	};
  2942	
  2943	static struct {
  2944		int		value;
  2945		char		*name;
  2946	} hisi_sas_debugfs_loop_code_mode[] = {
  2947		{ HISI_SAS_BIST_CODE_MODE_PRBS7,    "PRBS7" },
  2948		{ HISI_SAS_BIST_CODE_MODE_PRBS23,    "PRBS23" },
  2949		{ HISI_SAS_BIST_CODE_MODE_PRBS31,    "PRBS31" },
  2950		{ HISI_SAS_BIST_CODE_MODE_JTPAT,    "JTPAT" },
  2951		{ HISI_SAS_BIST_CODE_MODE_CJTPAT,    "CJTPAT" },
  2952		{ HISI_SAS_BIST_CODE_MODE_SCRAMBED_0,    "SCRAMBED_0" },
  2953		{ HISI_SAS_BIST_CODE_MODE_TRAIN,    "TRAIN" },
  2954		{ HISI_SAS_BIST_CODE_MODE_TRAIN_DONE,    "TRAIN_DONE" },
  2955		{ HISI_SAS_BIST_CODE_MODE_HFTP,    "HFTP" },
  2956		{ HISI_SAS_BIST_CODE_MODE_MFTP,    "MFTP" },
  2957		{ HISI_SAS_BIST_CODE_MODE_LFTP,    "LFTP" },
  2958		{ HISI_SAS_BIST_CODE_MODE_FIXED_DATA,    "FIXED_DATA" },
  2959	};
  2960	
  2961	static int hisi_sas_debugfs_bist_code_mode_show(struct seq_file *s, void *p)
  2962	{
  2963		struct hisi_hba *hisi_hba = s->private;
  2964		int i;
  2965	
  2966		for (i = 0; i < ARRAY_SIZE(hisi_sas_debugfs_loop_code_mode); i++) {
  2967			int match = (hisi_hba->bist_loopback_code_mode ==
  2968				     hisi_sas_debugfs_loop_code_mode[i].value);
  2969	
  2970			seq_printf(s, "%s%s%s ", match ? "[" : "",
  2971				   hisi_sas_debugfs_loop_code_mode[i].name,
  2972				   match ? "]" : "");
  2973		}
  2974		seq_puts(s, "\n");
  2975	
  2976		return 0;
  2977	}
  2978	
> 2979	ssize_t hisi_sas_debugfs_bist_code_mode_write(struct file *filp,
  2980						 const char __user *buf,
  2981						 size_t count, loff_t *ppos)
  2982	{
  2983		struct seq_file *m = filp->private_data;
  2984		struct hisi_hba *hisi_hba = m->private;
  2985		char kbuf[16] = {}, *pkbuf;
  2986		bool found = false;
  2987		int i;
  2988	
  2989		if (hisi_hba->bist_loopback_enable)
  2990			return -EINVAL;
  2991	
  2992		if (count >= sizeof(kbuf))
  2993			return -EINVAL;
  2994	
  2995		if (copy_from_user(kbuf, buf, count))
  2996			return -EINVAL;
  2997	
  2998		pkbuf = strstrip(kbuf);
  2999	
  3000		for (i = 0; i < ARRAY_SIZE(hisi_sas_debugfs_loop_code_mode); i++) {
  3001			if (!strncmp(hisi_sas_debugfs_loop_code_mode[i].name,
  3002				pkbuf, 16)) {
  3003				hisi_hba->bist_loopback_code_mode =
  3004					hisi_sas_debugfs_loop_code_mode[i].value;
  3005				found = true;
  3006				break;
  3007			}
  3008		}
  3009	
  3010		if (!found) {
  3011			dev_err(hisi_hba->dev, "unknown mode\n");
  3012			return -EINVAL;
  3013		}
  3014	
  3015		return count;
  3016	}
  3017	
  3018	static int hisi_sas_debugfs_bist_code_mode_open(struct inode *inode,
  3019						   struct file *filp)
  3020	{
  3021		return single_open(filp, hisi_sas_debugfs_bist_code_mode_show,
  3022				   inode->i_private);
  3023	}
  3024	
  3025	static const struct file_operations hisi_sas_debugfs_bist_code_mode_ops = {
  3026		.open = hisi_sas_debugfs_bist_code_mode_open,
  3027		.read = seq_read,
  3028		.write = hisi_sas_debugfs_bist_code_mode_write,
  3029		.llseek = seq_lseek,
  3030		.release = single_release,
  3031		.owner = THIS_MODULE,
  3032	};
  3033	
> 3034	ssize_t hisi_sas_debugfs_bist_phy_write(struct file *filp,
  3035						const char __user *buf,
  3036						size_t count, loff_t *ppos)
  3037	{
  3038		struct seq_file *m = filp->private_data;
  3039		struct hisi_hba *hisi_hba = m->private;
  3040		char kbuf[16] = {}, *pkbuf;
  3041		int val, phy;
  3042	
  3043		if (hisi_hba->bist_loopback_enable)
  3044			return -EINVAL;
  3045	
  3046		if (count >= sizeof(kbuf))
  3047			return -EINVAL;
  3048	
  3049		if (copy_from_user(kbuf, buf, count))
  3050			return -EINVAL;
  3051	
  3052		pkbuf = strstrip(kbuf);
  3053	
  3054		val = kstrtoint(pkbuf, 0, &phy);
  3055		if (val < 0)
  3056			return val;
  3057	
  3058		if (phy >= hisi_hba->n_phy) {
  3059			dev_err(hisi_hba->dev, "phy index %d exceeds limit\n", phy);
  3060			return -EINVAL;
  3061		}
  3062	
  3063		hisi_hba->bist_loopback_phy_id = phy;
  3064	
  3065		return count;
  3066	}
  3067	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
