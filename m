Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3032A1B0F12
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732804410; cv=none; b=WvjXTRw58pfl7fchD7C1R/83Xhw/jKbzssnK0p2ZtBTMdRy9x7+qbnDBw/78l7UxjrJVWarEbleUGb7N8FgejAcqf2S+UpGxiftl0vUWTYeLRY+3B/kVrwzujE8EAJGaxsYL6jPTBDPjUyr3SHLVoIYXzO+SF4itv6gXYz6as4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732804410; c=relaxed/simple;
	bh=fZS/Oi3vDJEMHAF17peq6I07s48KOqSbBAMW7u0Vqb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SMzNOXnExpdaaJ8V8mbTAjQ6RusnuQGh0zhrFhiQBbmy2BFhIgPGJILjo9dP5duAu9vFgV61g0Z6TW6dsS34KiGOY9Ela3/elpIej+bobQLzPgHeFa/+tV1Oci2UtaLRphFzYeBLhVNXweu9DE0jYyvgcmf/mHcSCca7Hjx6PeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+SWl89+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+SWl89+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732804408; x=1764340408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fZS/Oi3vDJEMHAF17peq6I07s48KOqSbBAMW7u0Vqb8=;
  b=J+SWl89+DPCWQMpi9N80bN5DbH4A2qG2PvQmyvlViDcNYhAaZD3drN+V
   Lh7DmjhgU5mp3NVJ2hZy1VlBSXXjlGDv7MyfzSas4JPbdeHcV2+jAPRED
   AmHM4nMiNFmMxxJ75MJt1URWw30gnLhFy6klZ0aETLyZ0svGUV2fPmrQY
   rdzgaR1TjoaRHE5XEfxTnOSCsyEQxCZcMCruoYHklwr4b/Ftsx/0pMOsd
   fL+bqzn7KJkrilY2Usvp3EScu2LpazEwmi+pxiYPM6Fucv3LTc+heokFc
   ALwWn1hi4TUNeJitmxFTDj5kw2WmmAzuCrjbftORed+QUEcLryP/2YoSh
   Q==;
X-CSE-ConnectionGUID: 5MOIXkQmSrSnx+9fawdkqQ==
X-CSE-MsgGUID: G/T3Dc1pRuSKNGLV9sULeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="20630637"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="20630637"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 06:33:27 -0800
X-CSE-ConnectionGUID: 6P7rhiO3T+GPcc7GvnYb+g==
X-CSE-MsgGUID: O4GaolrwQP+GIO1fXMMA+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92121963"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2024 06:33:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGfa8-0009fo-01;
	Thu, 28 Nov 2024 14:33:24 +0000
Date: Thu, 28 Nov 2024 22:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540] kernel/sched/bpf_sched.c:187:17:
 warning: no previous prototype for 'bpf_sched_entity_is_task'
Message-ID: <202411282229.dFuV8vuC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: 6f06e093b3708dcee5b7e4f0478e0206bc601da1 [1540/1540] sched/ebpf: Support task selection programmable
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241128/202411282229.dFuV8vuC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411282229.dFuV8vuC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411282229.dFuV8vuC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:113:
>> kernel/sched/bpf_sched.c:187:17: warning: no previous prototype for 'bpf_sched_entity_is_task' [-Wmissing-prototypes]
     187 | __bpf_kfunc int bpf_sched_entity_is_task(struct sched_entity *se)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/bpf_sched.c:195:33: warning: no previous prototype for 'bpf_sched_entity_to_task' [-Wmissing-prototypes]
     195 | __bpf_kfunc struct task_struct *bpf_sched_entity_to_task(struct sched_entity *se)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/bpf_sched.c:203:18: warning: no previous prototype for 'bpf_sched_tag_of_entity' [-Wmissing-prototypes]
     203 | __bpf_kfunc long bpf_sched_tag_of_entity(struct sched_entity *se)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_sched_entity_is_task +187 kernel/sched/bpf_sched.c

   186	
 > 187	__bpf_kfunc int bpf_sched_entity_is_task(struct sched_entity *se)
   188	{
   189		if (!se)
   190			return -EINVAL;
   191	
   192		return entity_is_task(se);
   193	}
   194	
 > 195	__bpf_kfunc struct task_struct *bpf_sched_entity_to_task(struct sched_entity *se)
   196	{
   197		if (se && entity_is_task(se))
   198			return task_of(se);
   199	
   200		return NULL;
   201	}
   202	
 > 203	__bpf_kfunc long bpf_sched_tag_of_entity(struct sched_entity *se)
   204	{
   205		if (!se)
   206			return -EINVAL;
   207	
   208		if (entity_is_task(se))
   209			return task_of(se)->tag;
   210	
   211		return group_cfs_rq(se)->tg->tag;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
