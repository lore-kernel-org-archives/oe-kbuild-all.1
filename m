Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A424F7464
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 19:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687720311; x=1719256311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LXQMQDsuVKBhgCKx7mpUujKoE6xJtOFP1bpw9r2JXj8=;
  b=BSVtF+MNLphtqyRP9byrdWTpQbNuyRb10zRKc7381qmNp4eQpzjJerLo
   Bt3ySF8zZYgF2YKmmE5xeSIdBhFUbW7XVPQTmZhEEwie/S7ZVVi8KygrD
   2RgrJe28lstpqGOhpyNbqLloI7CvX7lscsJpKVJBvEPNn7btQ2dcp3bN9
   tz6wDBFvvkBa99+8TBvmU0BGosBC+mA1mfZuP9xa4iLB9jDb4zJSLiHtc
   VFE3lFMVdvCCN9WnzQVKbxYGrk6QzmTBXfttLktUVV5tsp8HqXs18Fw0u
   PoDLM8IvrHdybS+7+k21SPZiYR1Q8FV74jv3vFTgG1dHG+0i7lK1HYGLC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="363657348"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="363657348"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 12:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="805780125"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="805780125"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jun 2023 12:11:49 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDV9I-000AEX-11;
	Sun, 25 Jun 2023 19:11:48 +0000
Date: Mon, 26 Jun 2023 03:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jingqi Liu <Jingqi.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/5] iommu/vt-d: debugfs: Support specifying source
 identifier and PASID
Message-ID: <202306260247.FFKVXdZt-lkp@intel.com>
References: <20230625150442.42197-3-Jingqi.liu@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230625150442.42197-3-Jingqi.liu@intel.com>

Hi Jingqi,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.4-rc7]
[also build test ERROR on linus/master next-20230623]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingqi-Liu/iommu-vt-d-debugfs-Define-domain_translation_struct-file-ops/20230625-231912
base:   v6.4-rc7
patch link:    https://lore.kernel.org/r/20230625150442.42197-3-Jingqi.liu%40intel.com
patch subject: [PATCH 2/5] iommu/vt-d: debugfs: Support specifying source identifier and PASID
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230626/202306260247.FFKVXdZt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306260247.FFKVXdZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306260247.FFKVXdZt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/intel/debugfs.c: In function 'domain_translation_struct_write':
>> drivers/iommu/intel/debugfs.c:409:21: error: 'INVALID_IOASID' undeclared (first use in this function); did you mean 'INVALID_VFSUID'?
     409 |         u32 pasid = INVALID_IOASID;
         |                     ^~~~~~~~~~~~~~
         |                     INVALID_VFSUID
   drivers/iommu/intel/debugfs.c:409:21: note: each undeclared identifier is reported only once for each function it appears in


vim +409 drivers/iommu/intel/debugfs.c

   401	
   402	static ssize_t domain_translation_struct_write(struct file *filp,
   403			                               const char __user *ubuf,
   404						       size_t cnt, loff_t *ppos)
   405	{
   406		char buf[BUF_SIZE], *srcid_ptr = NULL, *pasid_ptr = NULL;
   407		unsigned int seg, bus, slot, func;
   408		struct pci_dev *pdev = NULL;
 > 409		u32 pasid = INVALID_IOASID;
   410		char *key, *pbuf;
   411		int i = 0;
   412	
   413		if (cnt >= BUF_SIZE)
   414			return -EINVAL;
   415	
   416		if (copy_from_user(buf, ubuf, cnt))
   417			return -EFAULT;
   418	
   419		buf[cnt - 1] = 0;
   420		if (!strcmp(buf, "auto")) {
   421			if (show_domain_info)
   422				show_domain_info->pdev = NULL;
   423			*ppos += cnt;
   424			return cnt;
   425		}
   426	
   427		pbuf = buf;
   428	
   429		/* Seperate the input: one {source identifier, PASID} pair */
   430		while ((key = strsep(&pbuf, ", ")) != NULL) {
   431			if (!*key)
   432				continue;
   433			if (i >= 2) /* too many fields */
   434				return -EINVAL;
   435			if (i++ == 0)
   436				srcid_ptr = key;
   437			else
   438				pasid_ptr = key;
   439		}
   440	
   441		if (!srcid_ptr) /* no source identifier */
   442			return -EINVAL;
   443	
   444		/*
   445		 * The string of source identifier must be of the form:
   446		 * [<domain>:]<bus>:<device>.<func>
   447		 */
   448		i = sscanf(srcid_ptr, "%x:%x:%x.%x", &seg, &bus, &slot, &func);
   449		if (i != 4) {
   450			seg = 0;
   451			i = sscanf(srcid_ptr, "%x:%x.%x", &bus, &slot, &func);
   452			if (i != 3)
   453				return -EINVAL;
   454		}
   455	
   456		pdev = pci_get_domain_bus_and_slot(seg, bus, PCI_DEVFN(slot, func));
   457		if (!pdev)
   458			return -EINVAL;
   459	
   460		if (pasid_ptr &&
   461		    ((kstrtou32(pasid_ptr, 0, &pasid) < 0) || (pasid >= PASID_MAX)))
   462			return -EINVAL;
   463	
   464		if (!show_domain_info) {
   465			show_domain_info = kzalloc(sizeof(*show_domain_info),
   466					           GFP_KERNEL);
   467			if (!show_domain_info)
   468				return -EINVAL;
   469		}
   470	
   471		show_domain_info->pdev = pdev;
   472		show_domain_info->pasid = pasid;
   473	
   474		*ppos += cnt;
   475		return cnt;
   476	}
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
