Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F12414293
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739021822; cv=none; b=uH/NowvHsy1TJxpvyz/Vu7KXCJ54rmqxlqEip2JXIMavofCMtRvAFikwGAigCI+8s1yAUMTAXxgybyXFZ52yahoXJQJX5TUdhSGcjRBDIgxrGWlk+HsBlMiCOyMusDson0CWSE2jEC2sICgVnmNaSHtEZGeXSHqkGhC/kNc00Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739021822; c=relaxed/simple;
	bh=0OR077vzwML86c0J2BQg5a2oOWPwgoOJC3nSRGOSXcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TYRbt0E9hh9EsPYqYLov2ZJiHMH0HdKV594qW9HejZvElMd1u0iAo5lueIOkKRFn11yTnMzB0q3riRV5TENJ8UQAUZbFPsY17a1ZjrUTpb6slEdnf9Xud4k7qTqLuw270Y0zoaaiXSVMebb+ppozz/HgpqU54ZXYASOnfVlMNY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OG3aODva; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OG3aODva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739021819; x=1770557819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0OR077vzwML86c0J2BQg5a2oOWPwgoOJC3nSRGOSXcc=;
  b=OG3aODvaTJ/npg3rV9jTUwseGwkQ/l2a15ufgVk3a9mKR5CDVTNFR2Ry
   FL0qaGL7bs9ZefiEJ49xJs280KsfWpdrKvE/3fqWpMN8VSrBibXgXvk/c
   x9GadZnFVRloz3NY/NZuOyEQrjSHQt8CusesX4fMIKugOBmNq5/TWn7oI
   3JT9avyLYm/OF0Bl4hJkmrewOg/8dej0X2DKgyp2DXwU7vbYPPz2KO8y7
   hbAAk9oL+p1urswaoZDcXfdjK04jZOZjDYx8W811bun0C+4LArqt5279y
   qfHqBAg0I7T1xuaRQJHpXEviWubbWhutY0wb3znsuAc5qC8ig4Sg3NGca
   g==;
X-CSE-ConnectionGUID: 6A1Fq3pdTCmoxDr9+b6jEQ==
X-CSE-MsgGUID: unOp5/prS+uKcATEyjQDYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39346222"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39346222"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 05:36:59 -0800
X-CSE-ConnectionGUID: mOPMOf50T8ufGU2VplMSHA==
X-CSE-MsgGUID: X3Yxa6tVQzCxOrMY/8G3AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115850832"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Feb 2025 05:36:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgl0x-001004-15;
	Sat, 08 Feb 2025 13:36:55 +0000
Date: Sat, 8 Feb 2025 21:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linuxsecuritymodule:next 2/2] include/linux/security.h:2382:
 multiple definition of `security_uring_allowed';
 net/8021q/vlan.o:include/linux/security.h:2382: first defined here
Message-ID: <202502082120.6dPLoRV3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LinuxSecurityModule/kernel next
head:   c6ad9fdbd44b78f51fa50138247694774ab99e97
commit: c6ad9fdbd44b78f51fa50138247694774ab99e97 [2/2] io_uring,lsm,selinux: add LSM hooks for io_uring_setup()
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20250208/202502082120.6dPLoRV3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082120.6dPLoRV3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082120.6dPLoRV3-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: net/8021q/vlan_dev.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/8021q/vlan.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/8021q/vlan_netlink.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/8021q/vlan.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/8021q/vlanproc.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/8021q/vlan.o:include/linux/security.h:2382: first defined here
--
   alpha-linux-ld: net/sunrpc/xprt.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/socklib.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/xprtsock.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/sched.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/auth.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/auth_null.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/auth_tls.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/auth_unix.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/svc.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/svcsock.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/svcauth.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/svcauth_unix.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/addr.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/rpcb_clnt.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/timer.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/xdr.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/sunrpc_syms.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/cache.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/rpc_pipe.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/sysfs.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/svc_xprt.o: in function `security_uring_allowed':
   include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/xprtmultipath.o: in function `security_uring_allowed':
   include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/stats.o: in function `security_uring_allowed':
   include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/sysctl.o: in function `security_uring_allowed':
   net/sunrpc/sysctl.c:2382: multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:include/linux/security.h:2382: first defined here
--
   alpha-linux-ld: net/sunrpc/auth_gss/gss_mech_switch.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/auth_gss.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/svcauth_gss.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/auth_gss.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/gss_rpc_upcall.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/auth_gss.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/gss_rpc_xdr.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/auth_gss.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/trace.o: in function `security_uring_allowed':
   net/sunrpc/auth_gss/trace.c:2382: multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/auth_gss.o:include/linux/security.h:2382: first defined here
--
   alpha-linux-ld: net/sunrpc/auth_gss/gss_krb5_seal.o: in function `security_uring_allowed':
>> net/sunrpc/auth_gss/gss_krb5_seal.c:2382: multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/gss_krb5_mech.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/gss_krb5_unseal.o: in function `security_uring_allowed':
   net/sunrpc/auth_gss/gss_krb5_unseal.c:2382: multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/gss_krb5_mech.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/gss_krb5_wrap.o: in function `security_uring_allowed':
   include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/gss_krb5_mech.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/gss_krb5_crypto.o: in function `security_uring_allowed':
   include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/gss_krb5_mech.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/gss_krb5_keys.o: in function `security_uring_allowed':
   include/linux/security.h:2382: multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/gss_krb5_mech.o:include/linux/security.h:2382: first defined here
--
   alpha-linux-ld: fs/nfs/dir.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/file.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/getroot.o: in function `security_uring_allowed':
   fs/nfs/getroot.c:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/inode.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/super.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/io.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/direct.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/pagelist.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/read.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/symlink.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/unlink.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/write.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/namespace.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/mount_clnt.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/nfstrace.o: in function `security_uring_allowed':
   fs/nfs/nfstrace.c:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/export.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/sysfs.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/fs_context.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/sysctl.o: in function `security_uring_allowed':
   fs/nfs/sysctl.c:2382: multiple definition of `security_uring_allowed'; fs/nfs/client.o:include/linux/security.h:2382: first defined here
--
   alpha-linux-ld: fs/nfs/nfs3client.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/nfs3super.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/nfs3proc.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/nfs3super.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/nfs/nfs3xdr.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfs/nfs3super.o:include/linux/security.h:2382: first defined here
--
   alpha-linux-ld: fs/nfsd/nfssvc.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:fs/nfsd/trace.c:2382: first defined here
   alpha-linux-ld: fs/nfsd/nfsctl.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:fs/nfsd/trace.c:2382: first defined here
   alpha-linux-ld: fs/nfsd/nfsfh.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:fs/nfsd/trace.c:2382: first defined here
   alpha-linux-ld: fs/nfsd/vfs.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:fs/nfsd/trace.c:2382: first defined here
   alpha-linux-ld: fs/nfsd/export.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:fs/nfsd/trace.c:2382: first defined here
   alpha-linux-ld: fs/nfsd/auth.o: in function `security_uring_allowed':
   fs/nfsd/auth.c:2382: multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:fs/nfsd/trace.c:2382: first defined here
   alpha-linux-ld: fs/nfsd/lockd.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:fs/nfsd/trace.c:2382: first defined here
   alpha-linux-ld: fs/nfsd/nfscache.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:fs/nfsd/trace.c:2382: first defined here
   alpha-linux-ld: fs/nfsd/stats.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:fs/nfsd/trace.c:2382: first defined here
   alpha-linux-ld: fs/nfsd/filecache.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:fs/nfsd/trace.c:2382: first defined here
   alpha-linux-ld: fs/nfsd/nfs3proc.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:fs/nfsd/trace.c:2382: first defined here
   alpha-linux-ld: fs/nfsd/nfs3xdr.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:fs/nfsd/trace.c:2382: first defined here
   alpha-linux-ld: fs/nfsd/netlink.o: in function `security_uring_allowed':
   fs/nfsd/netlink.c:2382: multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:fs/nfsd/trace.c:2382: first defined here
--
   alpha-linux-ld: fs/lockd/clntproc.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/lockd/clntxdr.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/lockd/host.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/lockd/svc.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/lockd/svclock.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/lockd/svcshare.o: in function `security_uring_allowed':
   fs/lockd/svcshare.c:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/lockd/svcproc.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/lockd/svcsubs.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/lockd/mon.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/lockd/trace.o: in function `security_uring_allowed':
   fs/lockd/trace.c:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/lockd/xdr.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/lockd/clnt4xdr.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/lockd/xdr4.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here
   alpha-linux-ld: fs/lockd/svc4proc.o: in function `security_uring_allowed':
>> include/linux/security.h:2382: multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:include/linux/security.h:2382: first defined here


vim +2382 include/linux/security.h

  2359	
  2360	#ifdef CONFIG_IO_URING
  2361	#ifdef CONFIG_SECURITY
  2362	extern int security_uring_override_creds(const struct cred *new);
  2363	extern int security_uring_sqpoll(void);
  2364	extern int security_uring_cmd(struct io_uring_cmd *ioucmd);
  2365	extern int security_uring_allowed(void);
  2366	#else
  2367	static inline int security_uring_override_creds(const struct cred *new)
  2368	{
  2369		return 0;
  2370	}
  2371	static inline int security_uring_sqpoll(void)
  2372	{
  2373		return 0;
  2374	}
  2375	static inline int security_uring_cmd(struct io_uring_cmd *ioucmd)
  2376	{
  2377		return 0;
  2378	}
  2379	extern int security_uring_allowed(void)
  2380	{
  2381		return 0;
> 2382	}
  2383	#endif /* CONFIG_SECURITY */
  2384	#endif /* CONFIG_IO_URING */
  2385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
