Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F4D1991CB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 03:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764904677; cv=none; b=V1gewxurEA6VOKQP6V3IYU7V1vGxCQ9RLjOnbsLp0070BwjeyyTeE5lzByrbift8Fa7mClkg1Kml8uigqtH1LlBduHgaScQY5IINj+tQ4yuVxei20H2BQXCTvRaAot7OeVGBGMJ4+V/elF4PYrxXnNRtKYNYqhHkB7WJTWVLFfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764904677; c=relaxed/simple;
	bh=83duxmArc5w/30Ug2uAeYuEY7RZIUFecE2lZ2PX0Z9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDk9lRBTDOa9UBQow6bcfARfpCor2j0fqiokEHSvSgC4ppZY+Q7Q4UEWspQzwpiLVBHiF635YyEe6pvIRzinlttLZJWl6GI4HaaKQwI/opR9bQT2D/9Etj71IPdSBBw+JjM6Qg1ZWczn/kfgkZuLrZZOexaTpf+Z9FWBc+32enY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWkyK8tc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWkyK8tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764904674; x=1796440674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=83duxmArc5w/30Ug2uAeYuEY7RZIUFecE2lZ2PX0Z9s=;
  b=HWkyK8tcE8vk45gGqaZ/Wt8Ta6tdaBOIXbPbctWo51xo1+D0xzNrV6MD
   C/QVC7Zd0WVMLDIa6mckNh6GVtkwStL65pGdCt97BeqI9BW8u3g3sen2r
   pTiV1nKjbDH0g3ibvcri5t77q32Z4D7q8UCEt6rkGfl5CzR6qarDRKCIL
   7+uCToNSU1D0chbjtoV2as1phKEzd3f70UNd8+YkJACUtuT2Z6IXpWNdp
   jDNvPmOfjIDqG5OaYSsp8J1QRmT4okcEGVNyvtqCtfrEXofIIe7EH987f
   LCTOZhY1qFdFf7Q5QgkV7Gy5e9UpVZNxk/pZf77j3cdTvyvaXam5UU2gS
   Q==;
X-CSE-ConnectionGUID: dBAfIijqTku4fy/8GXhbBg==
X-CSE-MsgGUID: 3UqiXkw2SiKDKRRCuPTPvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65937723"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="65937723"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 19:17:54 -0800
X-CSE-ConnectionGUID: U62i0ojrT1e3lEKDl9oNVA==
X-CSE-MsgGUID: QDKHPcSFSHeDLQ3swWLOew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="194235838"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Dec 2025 19:17:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRMKM-00000000EWy-2uvg;
	Fri, 05 Dec 2025 03:17:50 +0000
Date: Fri, 5 Dec 2025 11:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/unevictable.c:156:6: warning:
 no previous prototype for function 'del_unevict_task'
Message-ID: <202512051133.cmihcZtm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xin,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   31b356d59497695e1135b4c6ea07b6d0bd148e07
commit: bba8483e73c9dae0b5c67f8143dc8f922a07580b [2/2] anolis: mm: unevictable: adjust three key functions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251205/202512051133.cmihcZtm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051133.cmihcZtm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051133.cmihcZtm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/unevictable.c:156:6: warning: no previous prototype for function 'del_unevict_task' [-Wmissing-prototypes]
     156 | void del_unevict_task(struct task_struct *tsk)
         |      ^
   mm/unevictable.c:156:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     156 | void del_unevict_task(struct task_struct *tsk)
         | ^
         | static 
   1 warning generated.


vim +/del_unevict_task +156 mm/unevictable.c

   155	
 > 156	void del_unevict_task(struct task_struct *tsk)
   157	{
   158		struct evict_pid_entry *result;
   159	
   160		if (!tsk) {
   161			struct evict_pid_entry *pid_entry, *tmp;
   162	
   163			mutex_lock(&pid_mutex);
   164			list_for_each_entry_safe(pid_entry, tmp, &pid_list, list) {
   165				rcu_read_lock();
   166				tsk = find_task_by_pid_ns(pid_entry->rootpid,
   167						&init_pid_ns);
   168				rcu_read_unlock();
   169				if (!tsk) {
   170					list_del(&pid_entry->list);
   171					__remove_entry(pid_entry);
   172					kfree(pid_entry);
   173				}
   174			}
   175			mutex_unlock(&pid_mutex);
   176			return;
   177		}
   178	
   179		mutex_lock(&pid_mutex);
   180		result = lookup_unevict_entry(tsk);
   181		if (result) {
   182			list_del(&result->list);
   183			__remove_entry(result);
   184			mutex_unlock(&pid_mutex);
   185			__evict_pid(result);
   186			kfree(result);
   187		} else
   188			mutex_unlock(&pid_mutex);
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
