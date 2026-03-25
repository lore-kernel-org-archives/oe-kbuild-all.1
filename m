Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99955F4F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 02:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774407047; cv=none; b=j4Qo8yerzg8GIO6Hm1aoxP3JGVCszOkaEQsaIvRWJPi9Z7UqU1dHTga90iI1cY+N2AfozCF87zGlU4UgrmR0qWbZ6uAbAWGT7kt70EbIWW9YV6QCwcG+reTK/xz6bZYqxabqB4TE6TLwfRALsAKnAqvac2WdHadKXl712/7JeaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774407047; c=relaxed/simple;
	bh=cqgtPBD8RZ2oWGumXThf/u98GhDQaAgnhijDLNBdyOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WglVsl4G8J9Jx8qDjKCnOikS2vK9p8XG50Rj/Gthb5JEZfk4PHwVg34rg4WiI/47Aw/agvZA7Xze6nB4D0QkUkJdzxSqtDCc8kII/nfO4RYRObEwaMnEE820EelUpIyGuae4TtTPkUFS0FyPhD37/8+O73VYPploQS5LdSiOgjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ep/Tdcyq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ep/Tdcyq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774407047; x=1805943047;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cqgtPBD8RZ2oWGumXThf/u98GhDQaAgnhijDLNBdyOk=;
  b=Ep/TdcyqU5Ay9Fq9hlVJPW8lSEOtrbeQ4V0Eoe3nbq1aiA6yngLlUtKi
   QK8X8dTjXmNU4c4JJiUEjqkgfRZpi3jvEWtCn2BdagUp5/jMw7z/LRpe6
   VwajJMO9Txzio1c2TTB+jnqtWAT58BRoBFwydBa/nPRYqttiwEU5GWHu/
   pMB7TSNRT8D4iW2ondThtdcPQ49oxAkiJUa92UwSOterlxBIbzZjLFsUk
   eH1n/SDcmU9kPwM3CpL/6ix6PS8r6KIELDKh0pEDwxLVTI98gtQlCevfI
   myR3+KpSXrZUA/PMNcn7NbqmM7OFU6/lMqDG48WSKiepQ2MG0HCMjyA8o
   Q==;
X-CSE-ConnectionGUID: 799M/ORFSMKoUJgQ7VDsKA==
X-CSE-MsgGUID: JIZg0+nDQjazc1h29K+JHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75463636"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75463636"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 19:50:45 -0700
X-CSE-ConnectionGUID: HmZxXKFoS1iJ0BNitc4FTA==
X-CSE-MsgGUID: n7qn0kU+RAatPsY6OiwiqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="248087078"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Mar 2026 19:50:43 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5EKO-000000005oD-49tY;
	Wed, 25 Mar 2026 02:50:40 +0000
Date: Wed, 25 Mar 2026 10:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [trace:bootconfig/for-next 16/16] init/main.c:468:1:
 warning: the frame size of 4304 bytes is larger than 2048 bytes
Message-ID: <202603251025.80VAkeiG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace b=
ootconfig/for-next
head:   1a427f2a710583872b6176ea8378e0a1a8719fc4
commit: 1a427f2a710583872b6176ea8378e0a1a8719fc4 [16/16] bootconfig: Apply =
early options from embedded config
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260325/2=
02603251025.80VAkeiG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260325/202603251025.80VAkeiG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251025.80VAkeiG-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   init/main.c: In function 'bootconfig_apply_early_params':
>> init/main.c:468:1: warning: the frame size of 4304 bytes is larger than =
2048 bytes [-Wframe-larger-than=3D]
     468 | }
         | ^


vim +468 init/main.c

   416=09
   417	/*
   418	 * do_early_param() is defined later in this file but called from
   419	 * bootconfig_apply_early_params() below, so we need a forward decla=
ration.
   420	 */
   421	static int __init do_early_param(char *param, char *val,
   422					 const char *unused, void *arg);
   423=09
   424	/*
   425	 * bootconfig_apply_early_params - dispatch kernel.* keys from the e=
mbedded
   426	 * bootconfig as early_param() calls.
   427	 *
   428	 * early_param() handlers must run before most of the kernel initial=
ises
   429	 * (e.g. before the GIC driver reads irqchip.gicv3_pseudo_nmi).  A b=
ootconfig
   430	 * attached to the initrd arrives too late for this because the init=
rd is not
   431	 * mapped yet when early params are processed.  The embedded bootcon=
fig lives
   432	 * in the kernel image itself (.init.data), so it is always reachabl=
e.
   433	 *
   434	 * This function is called from setup_boot_config() which runs in
   435	 * start_kernel() before parse_early_param(), making the timing corr=
ect.
   436	 */
   437	static void __init bootconfig_apply_early_params(void)
   438	{
   439		char val_buf[COMMAND_LINE_SIZE];
   440		struct xbc_node *knode, *root;
   441		const char *val;
   442=09
   443		root =3D xbc_find_node("kernel");
   444		if (!root)
   445			return;
   446=09
   447		/*
   448		 * Keys that do not match any early_param() handler are silently
   449		 * ignored =E2=80=94 do_early_param() always returns 0.
   450		 */
   451		xbc_node_for_each_key_value(root, knode, val) {
   452			if (xbc_node_compose_key_after(root, knode, xbc_namebuf, XBC_KEYLE=
N_MAX) < 0)
   453				continue;
   454=09
   455			if (!val) {
   456				do_early_param(xbc_namebuf, NULL, NULL, NULL);
   457				continue;
   458			}
   459=09
   460			/*
   461			 * We need to copy const char *val to a char pointer,
   462			 * which is what do_early_param() need, given it might
   463			 * call strsep(), strtok() later.
   464			 */
   465			strscpy(val_buf, val, sizeof(val_buf));
   466			do_early_param(xbc_namebuf, val_buf, NULL, NULL);
   467		}
 > 468	}
   469=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
