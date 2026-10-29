Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314045;
	b=gXkk09ZoYHKj0heLQ9ZuChjTtV9ejwMjTNNe0VZYPruPOAWAPOe+AV/t9TtJ11plD8vS
	 vS3nds+DLUvFguWRM5AqFBJl5AHIcq/nZ00zi1Qx6wXCQ+NOoD0pWFYXPsw+H2oc5HE/l
	 T9UnjFENbRSkXzxAfaMzifH2UHNh7pUGFLyvRbAi9UjbEy/S4IjIieUbBdlq/n20F37KD
	 4lxsRC2FFS0kJ6MLVuUa78kpzBokS9XngNDcF+1KNL6Rpmhm7qcEv1tnyPhTEnJWcjF+z
	 rqnNX24rwuCYJm//k4krtOaTGz4WKWDee5AGy6MoX6KaGVN6Aq3EmXoTQAY08VxX/bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314045;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OwxdGXsXL0Ow4fZM+kxvg3Eu+rXYVoGETrJEBEB5TMQ=;
	b=YRMCF/SVSD9aHy9amXkna7fdSEgUmbwU/pykENIxeeI7xU6Fe321S7fzF9+s2+KBlIns
	 V5wuejcNvGZsCoTDnhBVcUlxc5T7xvhepuSpdO0HHeXyRiFyxHZnEujXAeJifAn2Dpmzt
	 WjXEwxuofDU5goSwcjlUr88BtVcUKvcb8mwvgao6yoYc9ler2JvD+dbRmf6zwCcuPpFcK
	 Y/bOW/6FupIeM0Yoea3/AIcrCAdgm1nM1jb5Zmlc7TrgjcrthIdkWjCF5JnhS8Agvhjrx
	 Lr06KxWDYYXKNB0uuD9C1I/hQVnwK+so8X1lLCjgpH2l86DsoWGvJs32nmrgkbWNcJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PoUrtHRh;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0949606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 22:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0949606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PoUrtHRh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793314043; x=1824850043;
  h=date:from:to:cc:subject:message-id;
  bh=eKgVHjtsblVkBLKvPo9omJsErmEg+wfGcyO43ZqXcBw=;
  b=PoUrtHRh4STGLev8BN6pmUjR8WMvbXCC7io84psmPRV0FmvfOPj2KyRI
   OjcK5EKazv/utCfXVqSVjnu+pLbf+Drfe1obUQczkPPXnskejtD9YkFB1
   4TkHXYZWRLXPC0reYjsjY0YfxMiU3l2ulHu0VDXWrv0x0110Imf+dmcSu
   XkPVUlYPUkOD0OsRb9fwY6zCqHkMnS3dJYBeEGERJp8yd/3fUY2r5IJxm
   SLsV0HzsyvdAPPXaOmD+ODeexBL39+afT21Ql6gqlhhhBNhQ+3xNaFtB5
   Waqi8wIQbyVLFsbPkNUcV/rG0a0hM4ANpXPTRdBR7Lt57stezuA3v9LgD
   w==;
X-CSE-ConnectionGUID: A7v4oGcbTJ2Cbx2dVhfItw==
X-CSE-MsgGUID: GXeaDi5sQySJ0vEWuxN0sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2070956"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2070956"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 15:47:22 -0700
X-CSE-ConnectionGUID: qXOGjHblQPmzZ8pDM3Za5w==
X-CSE-MsgGUID: iX8Z67I7Qni40O4vLoEvGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5186077"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2026 15:47:20 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMYty-000000005Mh-35bB;
	Thu, 29 Oct 2026 22:47:18 +0000
Date: Thu, 29 Oct 2026 23:47:11 +0100
From: kernel test robot <lkp@intel.com>
To: Georgia Garcia <georgia.garcia@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 John Johansen <john.johansen@canonical.com>
Subject: [jj-apparmor:apparmor-next 2/22]
 security/apparmor/file.c:737:53: warning: variable 'file' is uninitialized
 when used here
Message-ID: <202610292346.ehqNujiE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   ce94927fa4173fcc1eca27bdc65a140064c8f1e6
commit: a913281f600157aa036b7c02afbb18a0ac115187 [2/22] apparmor: don't revalidate inherited files under files->file_lock
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20261029/202610292346.ehqNujiE-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610292346.ehqNujiE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610292346.ehqNujiE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/file.c:737:53: warning: variable 'file' is uninitialized when used here [-Wuninitialized]
     737 |                 int error = aa_file_perm(OP_INHERIT, cred, label, file,
         |                                                                   ^~~~
   security/apparmor/file.c:724:36: note: initialize the variable 'file' to silence this warning
     724 |         struct file *devnull = NULL, *file;
         |                                           ^
         |                                            = NULL
   1 warning generated.


vim +/file +737 security/apparmor/file.c

   719	
   720	/* based on selinux's flush_unauthorized_files */
   721	void aa_inherit_files(const struct cred *cred, struct files_struct *files)
   722	{
   723		struct aa_label *label = aa_get_newest_cred_label(cred);
   724		struct file *devnull = NULL, *file;
   725		bool devnull_tried = false;
   726		unsigned int n = 0;
   727	
   728		revalidate_tty(cred, label);
   729	
   730		/*
   731		 * Revalidate access to inherited open files. Each file is
   732		 * revalidated holding only a reference to it, with no locks
   733		 * held, as revalidation may sleep (e.g. unix socket mediation
   734		 * dropping path refs, or allocating path buffers).
   735		 */
   736		while ((n = iterate_fd(files, n, get_next_file, &file)) != 0) {
 > 737			int error = aa_file_perm(OP_INHERIT, cred, label, file,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
