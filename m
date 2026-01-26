Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEC22417D9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 22:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769467840; cv=none; b=KGnIvEG4s5/9iHVpWRsEz1UjNGDG1ta6T3umy1EvZ0BHBznzJm9S7IEBWxILXafZoy2hmMRlh1lyUFCLgKiLejcwAOhEKXlRfglFAq44kE7RjuZEVWQ5AeMvvVTuQamgd776Lqz9ASoXRpr/oE7u2Z88CltN2aWkMX+1TY2ac6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769467840; c=relaxed/simple;
	bh=t1wJk/DjGifY9oufoNsM237q154z6KflsujgQWOSA3I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JtQAaSD/fvirUV6ZbxCod8DzF2hGnWNDMZ8RXEq6rtbgNuhWIiAn/KTopTM33w+5ECGQMkvFcPi9cznA6VpeUuFtpaIIi/rBZrngdpqX0WuD8mMEgttZB+yzKouj2s7OilF4dCOWkpqiJRbX1uAoVtyKEXjJHozNv8gsC/t1GxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7Mq0QDE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7Mq0QDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769467839; x=1801003839;
  h=date:from:to:cc:subject:message-id;
  bh=t1wJk/DjGifY9oufoNsM237q154z6KflsujgQWOSA3I=;
  b=d7Mq0QDEXyubQFWYKBY5kkAvUtTumY3KuQHcJpumTTJBl5Cj89z3WvB1
   Qe67Se6hseJvZWF+H75W2uXbwbONPlJCDWt5J5cvwgv4XTbyrAEcEDHe0
   d8mT5pHlm1rUVHPmrhe2lVnfLCabYCnBjmsDtpL2OTPUfzdED/8vPH1WF
   gljTuoJ1XOHerfk/f3Hxw3thUHybvmZz3OHJdraSuDiHK3gWPuDHDvgMm
   cTi1eFTQ5Z1mFmf4eq6t413OaDujItBSFFwpLPw5LEL7EEujnxeWs8iz3
   vdpqRruh5dUzXk+3Pkbm4SLRnRKRC4ycxAiSjQm39YBsR8PCwjvOIueta
   Q==;
X-CSE-ConnectionGUID: 6Nr6GEGyQhmEfw3/UwI6zQ==
X-CSE-MsgGUID: 4LvYGItWSxuwwEN8kfmtzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="80954921"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="80954921"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 14:50:39 -0800
X-CSE-ConnectionGUID: JVcOPkjaQsOFXF7CNyABQg==
X-CSE-MsgGUID: HiCqvbfkRRmrBM+fndezKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212347953"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Jan 2026 14:50:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkVPm-00000000Xkk-1Mhp;
	Mon, 26 Jan 2026 22:50:34 +0000
Date: Tue, 27 Jan 2026 06:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bahubali B Gumaji <bahubali.bg@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>,
 "Sang-Soo Lee" <constant.lee@samsung.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 2/2]
 fs/smb/server/vfs_cache.c:94:31: sparse: sparse: dereference of noderef
 expression
Message-ID: <202601270605.0ZMnwnbK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   8cc38d4af66aa19d0e67d4b148abd6c50de339f8
commit: 8cc38d4af66aa19d0e67d4b148abd6c50de339f8 [2/2] ksmbd: add procfs interface for runtime monitoring and statistics
config: hexagon-randconfig-r111-20260126 (https://download.01.org/0day-ci/archive/20260127/202601270605.0ZMnwnbK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270605.0ZMnwnbK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270605.0ZMnwnbK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/server/vfs_cache.c:94:31: sparse: sparse: dereference of noderef expression
   fs/smb/server/vfs_cache.c:97:41: sparse: sparse: dereference of noderef expression
   fs/smb/server/vfs_cache.c:101:43: sparse: sparse: dereference of noderef expression
--
>> fs/smb/server/connection.c:27:23: sparse: sparse: symbol 'proc_clients' was not declared. Should it be static?
--
>> fs/smb/server/mgmt/user_session.c:54:10: sparse: sparse: cast to restricted __le16
   fs/smb/server/mgmt/user_session.c:55:10: sparse: sparse: cast to restricted __le16

vim +94 fs/smb/server/vfs_cache.c

    68	
    69	static int proc_show_files(struct seq_file *m, void *v)
    70	{
    71		struct ksmbd_file	*fp = NULL;
    72		unsigned int		id;
    73	
    74		seq_printf(m, "#%-10s %-10s %-10s %-10s %-15s %-10s %-10s %s\n",
    75			   "<tree id>", "<pid>", "<vid>", "<refcnt>",
    76			   "<oplock>", "<daccess>", "<saccess>",
    77			   "<name>");
    78	
    79		read_lock(&global_ft.lock);
    80		idr_for_each_entry(global_ft.idr, fp, id) {
    81			seq_printf(m, "%#-10x %#-10llx %#-10llx %#-10x",
    82				   fp->tcon->id,
    83				   fp->persistent_id,
    84				   fp->volatile_id,
    85				   atomic_read(&fp->refcount));
    86	
    87			if (!fp->f_opinfo) {
    88				seq_printf(m, " %-15s", " ");
    89			} else {
    90				const struct ksmbd_const_name *const_names;
    91				int count;
    92				unsigned int level;
    93	
  > 94				if (fp->f_opinfo->is_lease) {
    95					const_names = ksmbd_lease_const_names;
    96					count = ARRAY_SIZE(ksmbd_lease_const_names);
    97					level = le32_to_cpu(fp->f_opinfo->o_lease->state);
    98				} else {
    99					const_names = ksmbd_oplock_const_names;
   100					count = ARRAY_SIZE(ksmbd_oplock_const_names);
   101					level = fp->f_opinfo->level;
   102				}
   103				ksmbd_proc_show_const_name(m, " %-15s",
   104							   const_names, count, level);
   105			}
   106	
   107			seq_printf(m, " %#010x %#010x %s\n",
   108				   le32_to_cpu(fp->daccess),
   109				   le32_to_cpu(fp->saccess),
   110				   fp->filp->f_path.dentry->d_name.name);
   111		}
   112		read_unlock(&global_ft.lock);
   113		return 0;
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
