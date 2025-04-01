Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BD186353
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743504868; cv=none; b=PErW2zD5uYV8ct4k+zJjFN0soRseR8tnXQvBLUDUA4Pc1FWjY9F3TXxxqiMdj8dLr6+8pusZkdmjrErjueB03UhtdtE7BR4MLFXH1/06BmY5BdHYqmf7krBPoO2IStdOfKuhODd3/wWvmfBoA502Irf+kjUnRMnre4H9h57l5LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743504868; c=relaxed/simple;
	bh=YQ/GOKClGO4gt/iuPUIDtwcJOTFCCNQv7+pAlhWqLss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dd9VOiJGSO19vVbsMkmMxqBJyx2GLYbdinGNNT77DFrvDXoLkXK3REbysd1gkxp/RHt5l47a7lt9OuY9L6I5FRA+NGJxoarJbdFe2Wu76V8jSYwqsqz9bFp4vQ+8MQnubZeeUzvorq6lZn3hZM8QUr7UcBsEJUTya/+bRrAmGQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgSWcPq4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgSWcPq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743504867; x=1775040867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YQ/GOKClGO4gt/iuPUIDtwcJOTFCCNQv7+pAlhWqLss=;
  b=UgSWcPq42N8YhdJyaQ3RxjKerVDdABOFOwQ7r7kiy1CEKePfLPfBMxsO
   MW9jxMHJV2ZSlGr4pyf87CzGV61hUZX1DEG0Ii4i9nqQjgwEPzv76bUPP
   TazizTk69JZGkCnj8vMODW33OsGIheeB2k4DseWADoc003bgkS8EOf3EE
   x3OhYbNsacLsiE7aX8L8NliaOYMlk/2WcsH3WhnHYZEWbksdm2mh789aS
   9+GKfj3SwV9zgL4AbSXr83n+1p+Tk/NkAKGXwhyFc1fzaXXpyIUTTJjov
   gPubh7BsDKOVeUB073IF9apUnd8/edkVer9zK5xzR0D03UrqCRs5V+IQb
   g==;
X-CSE-ConnectionGUID: GTnsFp1/Rtaik9ptsgUV9g==
X-CSE-MsgGUID: oA+F5n/ERi+PlywZA3Yb1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55482095"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="55482095"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 03:54:26 -0700
X-CSE-ConnectionGUID: RhN09GUITGOFtNAIxSFD8A==
X-CSE-MsgGUID: SFZ14yr2T/2XWq3kG9iQPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="131075984"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Apr 2025 03:54:25 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzZG7-0009np-03;
	Tue, 01 Apr 2025 10:54:19 +0000
Date: Tue, 1 Apr 2025 18:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.14/zen-sauce 2/32] drivers/scsi/vhba/vhba.c:192:23: error:
 variable 'vhost' set but not used
Message-ID: <202504011807.hclGHSJ4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.14/zen-sauce
head:   53af25ba2daed6e2664a680250e2b32eac46bb89
commit: 6d141e3121676e9ca50d6465a622b9a5d572219a [2/32] ZEN: Add VHBA driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250401/202504011807.hclGHSJ4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011807.hclGHSJ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504011807.hclGHSJ4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/vhba/vhba.c: In function 'vhba_device_queue':
>> drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror=unused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^~~~~
   drivers/scsi/vhba/vhba.c: At top level:
   drivers/scsi/vhba/vhba.c:541:6: error: 'struct scsi_host_template' has no member named 'tag_alloc_policy'; did you mean 'tag_alloc_policy_rr'?
     541 |     .tag_alloc_policy = BLK_TAG_ALLOC_RR,
         |      ^~~~~~~~~~~~~~~~
         |      tag_alloc_policy_rr
   drivers/scsi/vhba/vhba.c:541:25: error: 'BLK_TAG_ALLOC_RR' undeclared here (not in a function)
     541 |     .tag_alloc_policy = BLK_TAG_ALLOC_RR,
         |                         ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/vhost +192 drivers/scsi/vhba/vhba.c

   189	
   190	static int vhba_device_queue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
   191	{
 > 192	    struct vhba_host *vhost;
   193	    struct vhba_command *vcmd;
   194	    unsigned long flags;
   195	
   196	    vhost = platform_get_drvdata(&vhba_platform_device);
   197	
   198	    vcmd = vhba_alloc_command();
   199	    if (!vcmd) {
   200	        return SCSI_MLQUEUE_HOST_BUSY;
   201	    }
   202	
   203	    vcmd->cmd = cmd;
   204	
   205	    spin_lock_irqsave(&vdev->cmd_lock, flags);
   206	#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 15, 0)
   207	    vcmd->metatag = scsi_cmd_to_rq(vcmd->cmd)->tag;
   208	#else
   209	    vcmd->metatag = vcmd->cmd->request->tag;
   210	#endif
   211	    list_add_tail(&vcmd->entry, &vdev->cmd_list);
   212	    spin_unlock_irqrestore(&vdev->cmd_lock, flags);
   213	
   214	    wake_up_interruptible(&vdev->cmd_wq);
   215	
   216	    return 0;
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
