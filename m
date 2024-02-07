Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB5C24B2F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707300895; cv=none; b=VzDqWPLT5Z7GQsS5NNtMw4UZB+61EjjS/VMUSS0GRS/NzDumD9xB6vErm4QQqHC4bn/z2c3GSeHXXpBQigF4iFF9Z7rIZP27FOaOhdK4VPDldt22234Hr/5Dd+aclNpCX+YQ4c5oc9H7xfmU3oJZLOBVuI64TiK72xMYjBW8IJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707300895; c=relaxed/simple;
	bh=mR2NGHe1q4RANYTUKhZHlzI1/G2Oh/xYlRw0TpSRrjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nEFmOiSbWFKI/qMR+74DlPeK+ZGj+b/dl9DNOjRtyAM2vEMX3dquZlTBFSYWAc/LC8F/ZT4Gt7rRzLj1+7giaJ4k3z/49RtYt9rpABDtcqEIEDHP8tjdvTCEaDKlaywAQ3i/Qniv95+KIKp9GCVx5SG63GepTAayPhEtXHgfhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYI+ypy+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYI+ypy+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707300894; x=1738836894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mR2NGHe1q4RANYTUKhZHlzI1/G2Oh/xYlRw0TpSRrjY=;
  b=WYI+ypy+0AoDiXmgCTzQVoG4Yn9qtxda2XoJ7IlPAMH660149brP9VIX
   Tv4HWWDyXET1WmKftllE9q/4RvkQ1f6vQq1jDwW6MA+WkAJYsL58yd0f1
   HKCfvuR3xFziScPqFWvP/G1iSFOOFBGSeSiHuwXuh+KH0Iwyl90vWMfAs
   idklux1gHmFav/1fWZxvV+HFROcxt7CnEJSNDbsHAPBX4HscydW4tjAzc
   NKV5UbA2KYUN1+7/AgSXj7ZNCBpP7cMAD4QnD2KIyBTewTXfqHGhLT4HZ
   SSboB+7mblzeq/PfBDdPPXXSTrePDJduz5iQjVhAHEA5bE79kh2LWrcnW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="838430"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="838430"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 02:14:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1601080"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2024 02:14:49 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXex4-0002Ti-33;
	Wed, 07 Feb 2024 10:14:46 +0000
Date: Wed, 7 Feb 2024 18:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [linux-next:master 4351/4898]
 include/trace/../../drivers/bus/mhi/host/trace.h:87:1: sparse: sparse: cast
 to restricted __le64
Message-ID: <202402071859.8qMhgJEQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ae0a045e6814c8c1d676d6153c605a65746aa29
commit: ceeb64f41fe6a1eb9fc56d583983a81f8f3dd058 [4351/4898] bus: mhi: host: Add tracing support
config: x86_64-randconfig-123-20240207 (https://download.01.org/0day-ci/archive/20240207/202402071859.8qMhgJEQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071859.8qMhgJEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402071859.8qMhgJEQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/bus/mhi/host/init.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, drivers/bus/mhi/host/trace.h):
>> include/trace/../../drivers/bus/mhi/host/trace.h:87:1: sparse: sparse: cast to restricted __le64
>> include/trace/../../drivers/bus/mhi/host/trace.h:87:1: sparse: sparse: restricted __le64 degrades to integer
>> include/trace/../../drivers/bus/mhi/host/trace.h:87:1: sparse: sparse: restricted __le64 degrades to integer
>> include/trace/../../drivers/bus/mhi/host/trace.h:87:1: sparse: sparse: cast to restricted __le32
>> include/trace/../../drivers/bus/mhi/host/trace.h:87:1: sparse: sparse: restricted __le32 degrades to integer
>> include/trace/../../drivers/bus/mhi/host/trace.h:87:1: sparse: sparse: restricted __le32 degrades to integer
>> include/trace/../../drivers/bus/mhi/host/trace.h:87:1: sparse: sparse: cast to restricted __le32
>> include/trace/../../drivers/bus/mhi/host/trace.h:87:1: sparse: sparse: restricted __le32 degrades to integer
>> include/trace/../../drivers/bus/mhi/host/trace.h:87:1: sparse: sparse: restricted __le32 degrades to integer
   include/trace/../../drivers/bus/mhi/host/trace.h:169:1: sparse: sparse: cast to restricted __le32
   include/trace/../../drivers/bus/mhi/host/trace.h:169:1: sparse: sparse: restricted __le32 degrades to integer
   include/trace/../../drivers/bus/mhi/host/trace.h:169:1: sparse: sparse: restricted __le32 degrades to integer
   include/trace/../../drivers/bus/mhi/host/trace.h:169:1: sparse: sparse: cast to restricted __le32
   include/trace/../../drivers/bus/mhi/host/trace.h:169:1: sparse: sparse: restricted __le32 degrades to integer
   include/trace/../../drivers/bus/mhi/host/trace.h:169:1: sparse: sparse: restricted __le32 degrades to integer
   include/trace/../../drivers/bus/mhi/host/trace.h:169:1: sparse: sparse: cast to restricted __le64
   include/trace/../../drivers/bus/mhi/host/trace.h:169:1: sparse: sparse: restricted __le64 degrades to integer
   include/trace/../../drivers/bus/mhi/host/trace.h:169:1: sparse: sparse: restricted __le64 degrades to integer
   drivers/bus/mhi/host/init.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +87 include/trace/../../drivers/bus/mhi/host/trace.h

    86	
  > 87	TRACE_EVENT(mhi_gen_tre,
    88	
    89		TP_PROTO(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
    90			 struct mhi_ring_element *mhi_tre),
    91	
    92		TP_ARGS(mhi_cntrl, mhi_chan, mhi_tre),
    93	
    94		TP_STRUCT__entry(
    95			__string(name, mhi_cntrl->mhi_dev->name)
    96			__field(int, ch_num)
    97			__field(void *, wp)
    98			__field(__le64, tre_ptr)
    99			__field(__le32, dword0)
   100			__field(__le32, dword1)
   101		),
   102	
   103		TP_fast_assign(
   104			__assign_str(name, mhi_cntrl->mhi_dev->name);
   105			__entry->ch_num = mhi_chan->chan;
   106			__entry->wp = mhi_tre;
   107			__entry->tre_ptr = mhi_tre->ptr;
   108			__entry->dword0 = mhi_tre->dword[0];
   109			__entry->dword1 = mhi_tre->dword[1];
   110		),
   111	
   112		TP_printk("%s: Chan: %d TRE: 0x%p TRE buf: 0x%llx DWORD0: 0x%08x DWORD1: 0x%08x\n",
   113			  __get_str(name), __entry->ch_num, __entry->wp, __entry->tre_ptr,
   114			  __entry->dword0, __entry->dword1)
   115	);
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
