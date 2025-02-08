Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC611A3157
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739020441; cv=none; b=ah6wcTu376ZGNGEHq8iLiusVmzQqFJStlaoMxxzC2xFfjkUOXZyXm6trQ2mwaK5lsheag/sASOdAOeWCiQhWMG4NFJ5ISKdISEoo35SGd83HJfZ4yCmZhWkojVcjL6wOE9Eo6z+MfHkkkL/b4ycgEKDKTbua2HqDjWOOt0ZjTp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739020441; c=relaxed/simple;
	bh=XLVaYm5H4HPpZMttvMYIKmmlREMg8ojMh5OH2Is3h/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rxBFito2ibqhyZEDJmdH+uzUU/2hNXVbuiJGoY1ZhwiCsp3zC6Buq+aa7ahlSlXT5/ef4vyTNkdnVABzyVVtwkPckqoScw7o97+OgoY+7l5VZEIIt5myndleKBR0qEHbXhsMo32xQQMYT2ROxeXEXK4KeHZFW6kBWf3CbekAjoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3WZtHuV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3WZtHuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739020439; x=1770556439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XLVaYm5H4HPpZMttvMYIKmmlREMg8ojMh5OH2Is3h/w=;
  b=Q3WZtHuVAV2bDOjCbSMb/grXr/uGIt+Gr3Pyfr09J4HKF1pLMnHVhlSr
   boEKvaGHPC54+b1AXcQzgqKaAbP/l9lbMxLbvxn887dePBtUffV2eF8q0
   zBdDd5YYQXE32LqUsPTIKFdb+UPcurvFJPTrJRtKTGChqWrQc3jvJxNBR
   wawVbMuCyKOygjTyxietsYDDBey2s1vlDZr+FscILOoEqIe9ugrR1pXsA
   nwLhfDV/AzVOfTLywIW4y3/X4ar7iPFSc2081Ea8jmOYXh4SNLWNGlj7u
   EzKv3yTrrmubPHOLZ10ik07VEU3qsg2MEi132C1HCtylBuYQ2rcIanpwg
   g==;
X-CSE-ConnectionGUID: vBQ8+OZETfSUiwdIE3fW5w==
X-CSE-MsgGUID: ZASdWJqQTHiQN2aXhQlxXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="51042362"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="51042362"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 05:13:58 -0800
X-CSE-ConnectionGUID: LWnckxL5TQaBYS8/dNeD/A==
X-CSE-MsgGUID: LkeM2fanQfO9v8joBqrT9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="142638988"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Feb 2025 05:13:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgkef-000zzP-2P;
	Sat, 08 Feb 2025 13:13:53 +0000
Date: Sat, 8 Feb 2025 21:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linuxsecuritymodule:next 2/2] (.text.security_uring_allowed+0x0):
 multiple definition of `security_uring_allowed';
 drivers/gpu/drm/drm_drv.o:(.text.security_uring_allowed+0x0): first defined
 here
Message-ID: <202502082108.4FNJDrub-lkp@intel.com>
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
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20250208/202502082108.4FNJDrub-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082108.4FNJDrub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082108.4FNJDrub-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/gpu/drm/drm_gem.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; drivers/gpu/drm/drm_drv.o:(.text.security_uring_allowed+0x0): first defined here
--
   hppa-linux-ld: net/llc/llc_input.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_core.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/llc/llc_output.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_core.o:(.text.security_uring_allowed+0x0): first defined here
--
   hppa-linux-ld: net/llc/llc_c_ev.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_if.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/llc/llc_c_ac.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_if.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/llc/llc_conn.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_if.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/llc/llc_c_st.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_if.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/llc/llc_pdu.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_if.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/llc/llc_sap.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_if.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/llc/llc_s_ac.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_if.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/llc/llc_s_ev.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_if.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/llc/llc_s_st.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_if.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/llc/af_llc.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_if.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/llc/llc_station.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_if.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/llc/llc_proc.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/llc/llc_if.o:(.text.security_uring_allowed+0x0): first defined here
--
   hppa-linux-ld: net/sunrpc/xprt.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/socklib.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/xprtsock.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/sched.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/auth.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/auth_null.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/auth_tls.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/auth_unix.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/svc.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/svcsock.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/svcauth.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/svcauth_unix.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/addr.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/rpcb_clnt.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/timer.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/xdr.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/sunrpc_syms.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/cache.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/rpc_pipe.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/sysfs.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/svc_xprt.o: in function `security_uring_allowed':
   (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/xprtmultipath.o: in function `security_uring_allowed':
   (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/stats.o: in function `security_uring_allowed':
   (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/sysctl.o: in function `security_uring_allowed':
   (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/clnt.o:(.text.security_uring_allowed+0x0): first defined here
--
   hppa-linux-ld: net/sunrpc/auth_gss/gss_mech_switch.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/auth_gss.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/auth_gss/svcauth_gss.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/auth_gss.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/auth_gss/gss_rpc_upcall.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/auth_gss.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/auth_gss/gss_rpc_xdr.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/auth_gss.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/auth_gss/trace.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/auth_gss.o:(.text.security_uring_allowed+0x0): first defined here
--
   hppa-linux-ld: net/sunrpc/auth_gss/gss_krb5_seal.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/gss_krb5_mech.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/auth_gss/gss_krb5_unseal.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/gss_krb5_mech.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/auth_gss/gss_krb5_wrap.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/gss_krb5_mech.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/auth_gss/gss_krb5_crypto.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/gss_krb5_mech.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: net/sunrpc/auth_gss/gss_krb5_keys.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; net/sunrpc/auth_gss/gss_krb5_mech.o:(.text.security_uring_allowed+0x0): first defined here
--
   hppa-linux-ld: drivers/net/bonding/bond_3ad.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; drivers/net/bonding/bond_main.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: drivers/net/bonding/bond_alb.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; drivers/net/bonding/bond_main.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: drivers/net/bonding/bond_sysfs.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; drivers/net/bonding/bond_main.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: drivers/net/bonding/bond_sysfs_slave.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; drivers/net/bonding/bond_main.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: drivers/net/bonding/bond_debugfs.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; drivers/net/bonding/bond_main.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: drivers/net/bonding/bond_netlink.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; drivers/net/bonding/bond_main.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: drivers/net/bonding/bond_options.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; drivers/net/bonding/bond_main.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: drivers/net/bonding/bond_procfs.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; drivers/net/bonding/bond_main.o:(.text.security_uring_allowed+0x0): first defined here
--
   hppa-linux-ld: fs/nfs/dir.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/file.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/getroot.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/inode.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/super.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/io.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/direct.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/pagelist.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/read.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/symlink.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/unlink.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/write.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/namespace.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/mount_clnt.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/nfstrace.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/export.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/sysfs.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/fs_context.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/sysctl.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/client.o:(.text.security_uring_allowed+0x0): first defined here
--
   hppa-linux-ld: fs/nfs/nfs3client.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/nfs3super.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/nfs3proc.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/nfs3super.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfs/nfs3xdr.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfs/nfs3super.o:(.text.security_uring_allowed+0x0): first defined here
--
   hppa-linux-ld: fs/nfsd/nfssvc.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfsd/nfsctl.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfsd/nfsfh.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfsd/vfs.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfsd/export.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfsd/auth.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfsd/lockd.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfsd/nfscache.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfsd/stats.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfsd/filecache.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfsd/nfs3proc.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfsd/nfs3xdr.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/nfsd/netlink.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/nfsd/trace.o:(.text.security_uring_allowed+0x0): first defined here
--
   hppa-linux-ld: fs/lockd/clntproc.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/lockd/clntxdr.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/lockd/host.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/lockd/svc.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/lockd/svclock.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/lockd/svcshare.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/lockd/svcproc.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/lockd/svcsubs.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/lockd/mon.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/lockd/trace.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/lockd/xdr.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/lockd/clnt4xdr.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/lockd/xdr4.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
   hppa-linux-ld: fs/lockd/svc4proc.o: in function `security_uring_allowed':
>> (.text.security_uring_allowed+0x0): multiple definition of `security_uring_allowed'; fs/lockd/clntlock.o:(.text.security_uring_allowed+0x0): first defined here
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
