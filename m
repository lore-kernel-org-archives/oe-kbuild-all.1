Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A000136CE19
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 17:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257176; cv=none; b=EZs37cJrQ4msqEvQ5OCXyJN8oQ55rO8HiqACrTWDuuXeuKqCADKIb49ek35nni5+9Y9ZJUJRqJsSMcRUz8v7NehpFTra8AQ+XDuXmHqUi8cZUi8O7P02Vy2R2CFcjd7mNMJxrrLeiAGctW19HqEDTz6FS1BlGNZIPsobR16DTQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257176; c=relaxed/simple;
	bh=7C1Mfmi7fkePJT8knR5wWvt0hd9nCwNn89rZ6qYSrDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CWFGHxqNTj7g/vCP9gGpYgbUDN574Pq7Q8a5D9Ta2ne4aIk93f3FRhA/w8wtJeuXa2IWNhsQDf3ViVOZXpnxYvT/a4liCoyDbhQR9uxtNFz6PFAr/8erY4xSdErYA1fR1aZVKVD4UW4QkujniSLYYnnalJ8K0f0Pu3F0aTgUMa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1l85O5g; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1l85O5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792257173; x=1823793173;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7C1Mfmi7fkePJT8knR5wWvt0hd9nCwNn89rZ6qYSrDQ=;
  b=h1l85O5gakEbLfE8gjIVXQaYV/g2z8iHFuqa4KD7nFzo18BkHk/+Nimd
   BQrfsAu0/GROqm92KtiwDCXVZMqVLke+QeJLqXhRf1qesRq/AOkg7bYu7
   Gwe7ewGXmhD/esuJ7v1YZ/FLkevAS07WiMktO4ckACCdx+he+f7qDbvm8
   L706GMcuBAL6XSfGJfztrxbFUFhpRcO74e5jIQ/zWn5AgMJzfZ0bAMRte
   4yOYV0FsVf/xgg7tcnSsy1uzdSVQMm4B+Ej21cAeBKUIrrK/AhNcmobBq
   rnkt/wL0nI39B9XJsW0Lg8Nh+QW5DDtmm/I5ryd0svxYuXJHdzSiKAhKg
   w==;
X-CSE-ConnectionGUID: qZb0A0AMTAi0oJAX8nuwSA==
X-CSE-MsgGUID: UsdwledbRrGQ+4sV4CNLmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908848"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="908848"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 10:12:52 -0700
X-CSE-ConnectionGUID: VSP4fps0SZKu9TxOnYrv4A==
X-CSE-MsgGUID: 1clrMg3JTc2gFoxEhCNCSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2242998"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Oct 2026 10:12:51 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xI7xh-00000000JXu-1QYh;
	Sat, 17 Oct 2026 17:12:49 +0000
Date: Sun, 18 Oct 2026 01:12:14 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-add-OMR-event-ANBZ51468 11/11]
 include/linux/unevictable.h:51:57: warning: 'struct cgroup_taskset' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202610180028.pAt1zKtD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-add-OMR-e=
vent-ANBZ51468
head:   2ee4460ef69eb7f1a40741d26df51a3565558ea4
commit: ca52bb27199fe783cfa248f43f8e86bcf15843c6 [11/11] anolis: mm/unevict=
able: re-arm text locking on post-scan dlopen
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/2026101=
8/202610180028.pAt1zKtD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261018/202610180028.pAt1zKtD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180028.pAt1zKtD-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mmap.c:60:
>> include/linux/unevictable.h:51:57: warning: 'struct cgroup_taskset' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
      51 | static inline void mem_cgroup_attach_unevictable(struct cgroup_t=
askset *tset)
         |                                                         ^~~~~~~~=
~~~~~~


vim +51 include/linux/unevictable.h

acc0f6b61e192d Xin Hao    2022-12-02  10 =20
acc0f6b61e192d Xin Hao    2022-12-02  11  static inline bool unevictable_en=
abled(void)
acc0f6b61e192d Xin Hao    2022-12-02  12  {
acc0f6b61e192d Xin Hao    2022-12-02  13  	return static_branch_unlikely(&u=
nevictable_enabled_key);
acc0f6b61e192d Xin Hao    2022-12-02  14  }
8586d4b5f2a5c4 Xin Hao    2022-12-03  15  bool is_memcg_unevictable_enabled=
(struct mem_cgroup *memcg);
8586d4b5f2a5c4 Xin Hao    2022-12-03  16  void memcg_increase_unevict_size(=
struct mem_cgroup *memcg, unsigned long size);
8586d4b5f2a5c4 Xin Hao    2022-12-03  17  void memcg_decrease_unevict_size(=
struct mem_cgroup *memcg, unsigned long size);
8586d4b5f2a5c4 Xin Hao    2022-12-03  18  bool is_unevictable_size_overflow=
(struct mem_cgroup *memcg);
8586d4b5f2a5c4 Xin Hao    2022-12-03  19  unsigned long memcg_exstat_text_u=
nevict_gather(struct mem_cgroup *memcg);
9f95c5d2e9cad8 Zelin Deng 2026-09-01  20  void mem_cgroup_attach_unevictabl=
e(struct cgroup_taskset *tset);
8586d4b5f2a5c4 Xin Hao    2022-12-03  21  void memcg_all_processes_unevict(=
struct mem_cgroup *memcg, bool enable);
8586d4b5f2a5c4 Xin Hao    2022-12-03  22  void del_unevict_task(struct task=
_struct *tsk);
8586d4b5f2a5c4 Xin Hao    2022-12-03  23  void clean_task_unevict_size(stru=
ct task_struct *tsk);
d30f7906f08ec3 Zelin Deng 2026-09-01  24  void unevict_task_fork(struct tas=
k_struct *tsk);
ca52bb27199fe7 Zelin Deng 2026-09-18  25  void unevict_rearm_current(void);
acc0f6b61e192d Xin Hao    2022-12-02  26  #else
acc0f6b61e192d Xin Hao    2022-12-02  27  static inline bool unevictable_en=
abled(void)
acc0f6b61e192d Xin Hao    2022-12-02  28  {
acc0f6b61e192d Xin Hao    2022-12-02  29  	return false;
acc0f6b61e192d Xin Hao    2022-12-02  30  }
8586d4b5f2a5c4 Xin Hao    2022-12-03  31  static inline bool is_memcg_unevi=
ctable_enabled(struct mem_cgroup *memcg)
8586d4b5f2a5c4 Xin Hao    2022-12-03  32  {
8586d4b5f2a5c4 Xin Hao    2022-12-03  33  	return false;
8586d4b5f2a5c4 Xin Hao    2022-12-03  34  }
8586d4b5f2a5c4 Xin Hao    2022-12-03  35  static inline void memcg_increase=
_unevict_size(struct mem_cgroup *memcg,
8586d4b5f2a5c4 Xin Hao    2022-12-03  36  					       unsigned long size)
8586d4b5f2a5c4 Xin Hao    2022-12-03  37  {
8586d4b5f2a5c4 Xin Hao    2022-12-03  38  }
8586d4b5f2a5c4 Xin Hao    2022-12-03  39  static inline void memcg_decrease=
_unevict_size(struct mem_cgroup *memcg,
8586d4b5f2a5c4 Xin Hao    2022-12-03  40  					       unsigned long size)
8586d4b5f2a5c4 Xin Hao    2022-12-03  41  {
8586d4b5f2a5c4 Xin Hao    2022-12-03  42  }
8586d4b5f2a5c4 Xin Hao    2022-12-03  43  static inline bool is_unevictable=
_size_overflow(struct mem_cgroup *memcg)
8586d4b5f2a5c4 Xin Hao    2022-12-03  44  {
8586d4b5f2a5c4 Xin Hao    2022-12-03  45  	return false;
8586d4b5f2a5c4 Xin Hao    2022-12-03  46  }
8586d4b5f2a5c4 Xin Hao    2022-12-03  47  static inline unsigned long memcg=
_exstat_text_unevict_gather(struct mem_cgroup *memcg)
8586d4b5f2a5c4 Xin Hao    2022-12-03  48  {
8586d4b5f2a5c4 Xin Hao    2022-12-03  49  	return 0;
8586d4b5f2a5c4 Xin Hao    2022-12-03  50  }
9f95c5d2e9cad8 Zelin Deng 2026-09-01 @51  static inline void mem_cgroup_att=
ach_unevictable(struct cgroup_taskset *tset)

:::::: The code at line 51 was first introduced by commit
:::::: 9f95c5d2e9cad8cbf1712aadceb8268703e0eff7 anolis: mm/unevictable: mov=
e cgroup migration arm/disarm from can_attach to attach

:::::: TO: Zelin Deng <zelin.deng@linux.alibaba.com>
:::::: CC: =E5=B0=8F=E9=BE=99 <chenghaosong.chs@alibaba-inc.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
