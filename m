Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFED414267
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 04:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709699477; cv=none; b=Apx5x+28rh6g47VUx/miMwz25tcrGfWO2B5MzMIB+zq2a2OToemFRGVQnHV0uG+Ta2OfNgwy/XWHuoIwhYTI7zIAZN/Dc+aOETIdVRqn4MQ398FcKT+ykUjifH40WUryY0x7Jz0bPZVydQta+rmLWssp7fIdwuS3xMPDK62fcf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709699477; c=relaxed/simple;
	bh=zVjg+8im+okR0302GPSTUJfhrLOXDM50HulrTpw1Hf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JNjk1sqD+5QKJrjdpOIdEzzRLz11P7stVMwlmravZW93jhtbxnj7as32cZQDV7SPClRuJbxolhdDIvSWWtjvdsX41FbJR5M82AYOgO5OjbusTYJ973oeNNGOpzSeT7SY7yjXEutMkKsuQihaQwSAqWDfeeooF+FDwT5Ho2UK0CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LF+HFAer; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LF+HFAer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709699476; x=1741235476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zVjg+8im+okR0302GPSTUJfhrLOXDM50HulrTpw1Hf0=;
  b=LF+HFAerHWvwC4g3K1sWCJSVDNvOoToeVsg4khBHevk0fyozH1J+LYHP
   tavQl7CGPsvNDXrmEtEjtd7NNaArUud9PVMjYF9+pMnBZ0HPVN5TOJOaG
   ToGQcnXILhWnUUDiKPSLHYMp9WYKVsv1LIbI85bAV/WIXGNP/v9bTaBLC
   /6WMoJoOE5hX+EPZd7W2+k1irE5K32KYNnO5x+PpBmpFMS2YTCJ1D9I8k
   KoSYEjh5ghRHt0TkdPphTabxcPP8yrgNkREfwfkYH49Sg+u9IBhK8BYeR
   ehhQwcByJORbKDfw0avgKW2oes+Lc8m2rvDlbhxBNHcqhq746TCU6LtsX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8056441"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="8056441"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 20:31:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="14183953"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2024 20:31:09 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhivq-0003uF-2I;
	Wed, 06 Mar 2024 04:31:06 +0000
Date: Wed, 6 Mar 2024 12:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 25544/27434] mm/unevictable.c:155:6:
 warning: no previous prototype for function 'del_unevict_task'
Message-ID: <202403061219.6Pa0KELN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 9d1934d87f9535fc94ba8f4597063f0f8d1b28f8 [25544/27434] anolis: mm: unevictable: adjust three key functions
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240306/202403061219.6Pa0KELN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061219.6Pa0KELN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061219.6Pa0KELN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/unevictable.c:155:6: warning: no previous prototype for function 'del_unevict_task' [-Wmissing-prototypes]
     155 | void del_unevict_task(struct task_struct *tsk)
         |      ^
   mm/unevictable.c:155:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     155 | void del_unevict_task(struct task_struct *tsk)
         | ^
         | static 
   1 warning generated.


vim +/del_unevict_task +155 mm/unevictable.c

   154	
 > 155	void del_unevict_task(struct task_struct *tsk)
   156	{
   157		struct evict_pid_entry *result;
   158	
   159		if (!tsk) {
   160			struct evict_pid_entry *pid_entry, *tmp;
   161	
   162			mutex_lock(&pid_mutex);
   163			list_for_each_entry_safe(pid_entry, tmp, &pid_list, list) {
   164				rcu_read_lock();
   165				tsk = find_task_by_pid_ns(pid_entry->rootpid,
   166						&init_pid_ns);
   167				rcu_read_unlock();
   168				if (!tsk) {
   169					list_del(&pid_entry->list);
   170					__remove_entry(pid_entry);
   171					kfree(pid_entry);
   172				}
   173			}
   174			mutex_unlock(&pid_mutex);
   175			return;
   176		}
   177	
   178		mutex_lock(&pid_mutex);
   179		result = lookup_unevict_entry(tsk);
   180		if (result) {
   181			list_del(&result->list);
   182			__remove_entry(result);
   183			mutex_unlock(&pid_mutex);
   184			__evict_pid(result);
   185			kfree(result);
   186		} else
   187			mutex_unlock(&pid_mutex);
   188	}
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
