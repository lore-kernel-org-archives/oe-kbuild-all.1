Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7351E3762
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 01:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768873175; cv=none; b=R0rdDjavlpOSf544xa0YiEYjgni4szgFg/qE5UnyRrIk/IlSlejHLti4RmK23nO0gnCWLEnFSSU6xM8/HxsOMBorpKxJlqRhnBTpd3V431J7RtYH+98zw78ebwLrTZcmAHXWcl62FT1D2LHd+BBOCxmbMMd3JRABXvA+yyMr2es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768873175; c=relaxed/simple;
	bh=DBb8z8rweubrZ0CXD4Jtjarq9VnUF/khrGBbCrVF5RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Dr/ZoJRabFwfGZ3GhCUfx0fZ/wwS27IamWl44LQAD0BiKSQxT5Fb/BiSSOLN0INd3P0N+DTA2g90ikIvc4LHQkGs5EdPR0fUncqavUGDLYHxuZHYJgxtMMNg5EVm4eLxTycVWH/bdTVDEsE/6HBshvL2Jow+7v+Ke8GOz7dK1vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XaoyPCgF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XaoyPCgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768873173; x=1800409173;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DBb8z8rweubrZ0CXD4Jtjarq9VnUF/khrGBbCrVF5RQ=;
  b=XaoyPCgF/O2/kDnenn+x9zYHSlBcbaOnWaqBWoL8zOdlaBezUEGuZWRo
   J3s9yYCN/oil+m168uqunhB196cGWiKVaaKgV+AsTiw40XoCGtwAVOK84
   SD0IIawqR4m7xdwwiKt5z+l6OC7a5FDnjWV9SrrTb1+RW1t8gM8pRNaBq
   c1rFWYnLM1Q3qRjX+PCs3jmuMLmUpV8MTGvF9fMZxEsWMuIPoUJgC1g8p
   U/trXc8DFEN5D+CwHUKUYIAMwUBvNbJl/dwvBrPQ6QE4n251h6DGkjXPJ
   lzTyTCVCkJhvapPlvIwee/f4FPTltBkXm3jwiL9s0H70qwhy70RI9VOSq
   Q==;
X-CSE-ConnectionGUID: XLiIxF00SBCCuUWJSBO+jg==
X-CSE-MsgGUID: iYRQHMiuQRGOq9L2mhYkTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70239745"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="70239745"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 17:39:31 -0800
X-CSE-ConnectionGUID: NsajL/YBQAuhSmU2V2k06w==
X-CSE-MsgGUID: 7HUpWQ7/QLaSzQba5glrmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="236665791"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Jan 2026 17:39:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi0iM-00000000OSL-2PEx;
	Tue, 20 Jan 2026 01:39:26 +0000
Date: Tue, 20 Jan 2026 09:38:50 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, =?utf-8?Q?"Micka=C3=ABl?= =?utf-8?Q?_Sala=C3=BCn"?= <mic@digikod.net>
Subject: [mic:next 2/8] security/landlock/fs.c:1043:23: warning:
 variable 'access_dom' set but not used
Message-ID: <202601200900.wonk9M0m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
head:   bdb672bf4c5d0833b9beacb9c2204168b92cc48d
commit: 1ebf8e8d3245f6c985ba1c2cdfa0a7d1cd74438f [2/8] landlock: Transpose =
the layer masks data structure
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260120=
/202601200900.wonk9M0m-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260120/202601200900.wonk9M0m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200900.wonk9M0m-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   security/landlock/fs.c: In function 'collect_domain_accesses':
>> security/landlock/fs.c:1043:23: warning: variable 'access_dom' set but n=
ot used [-Wunused-but-set-variable]
    1043 |         unsigned long access_dom;
         |                       ^~~~~~~~~~


vim +/access_dom +1043 security/landlock/fs.c

9da82b20fde958 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1012 =20
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1013  /**
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1014   * collect_=
domain_accesses - Walk through a file path and collect accesses
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1015   *
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1016   * @domain:=
 Domain to check against.
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1017   * @mnt_roo=
t: Last directory to check.
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1018   * @dir: Di=
rectory to start the walk from.
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1019   * @layer_m=
asks_dom: Where to store the collected accesses.
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1020   *
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1021   * This hel=
per is useful to begin a path walk from the @dir directory to a
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1022   * @mnt_roo=
t directory used as a mount point.  This mount point is the common
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1023   * ancestor=
 between the source and the destination of a renamed and linked
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1024   * file.  W=
hile walking from @dir to @mnt_root, we record all the domain's
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1025   * allowed =
accesses in @layer_masks_dom.
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1026   *
49c9e09d961025 Micka=C3=ABl Sala=C3=BCn       2025-11-28  1027   * Because =
of disconnected directories, this walk may not reach @mnt_dir.  In
49c9e09d961025 Micka=C3=ABl Sala=C3=BCn       2025-11-28  1028   * this cas=
e, the walk will continue to @mnt_dir after this call.
49c9e09d961025 Micka=C3=ABl Sala=C3=BCn       2025-11-28  1029   *
106794c46b13a2 G=C3=BCnther Noack        2022-10-18  1030   * This is simil=
ar to is_access_to_paths_allowed() but much simpler because it
106794c46b13a2 G=C3=BCnther Noack        2022-10-18  1031   * only handles =
walking on the same mount point and only checks one set of
106794c46b13a2 G=C3=BCnther Noack        2022-10-18  1032   * accesses.
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1033   *
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1034   * Returns:
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1035   * - true i=
f all the domain access rights are allowed for @dir;
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1036   * - false =
if the walk reached @mnt_root.
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1037   */
1ebf8e8d3245f6 G=C3=BCnther Noack        2025-12-30  1038  static bool coll=
ect_domain_accesses(const struct landlock_ruleset *const domain,
1ebf8e8d3245f6 G=C3=BCnther Noack        2025-12-30  1039  				    const st=
ruct dentry *const mnt_root,
1ebf8e8d3245f6 G=C3=BCnther Noack        2025-12-30  1040  				    struct d=
entry *dir,
1ebf8e8d3245f6 G=C3=BCnther Noack        2025-12-30  1041  				    struct l=
ayer_access_masks *layer_masks_dom)
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1042  {
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06 @1043  	unsigned l=
ong access_dom;
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1044  	bool ret =
=3D false;
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1045 =20
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1046  	if (WARN_O=
N_ONCE(!domain || !mnt_root || !dir || !layer_masks_dom))
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1047  		return tr=
ue;
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1048  	if (is_nou=
ser_or_private(dir))
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1049  		return tr=
ue;
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1050 =20
0e741011296416 Konstantin Meskhidze 2023-10-26  1051  	access_dom =3D landl=
ock_init_layer_masks(domain, LANDLOCK_MASK_ACCESS_FS,
7a11275c378753 Konstantin Meskhidze 2023-10-26  1052  					       layer_mas=
ks_dom,
7a11275c378753 Konstantin Meskhidze 2023-10-26  1053  					       LANDLOCK_=
KEY_INODE);
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1054 =20
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1055  	dget(dir);
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1056  	while (tru=
e) {
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1057  		struct de=
ntry *parent_dentry;
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1058 =20
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1059  		/* Gets a=
ll layers allowing all domain accesses. */
1ebf8e8d3245f6 G=C3=BCnther Noack        2025-12-30  1060  		if (landlock_u=
nmask_layers(find_rule(domain, dir),
1ebf8e8d3245f6 G=C3=BCnther Noack        2025-12-30  1061  					   layer_ma=
sks_dom)) {
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1062  			/*
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1063  			 * Stops=
 when all handled accesses are allowed by at
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1064  			 * least=
 one rule in each layer.
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1065  			 */
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1066  			ret =3D =
true;
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1067  			break;
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1068  		}
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1069 =20
49c9e09d961025 Micka=C3=ABl Sala=C3=BCn       2025-11-28  1070  		/*
49c9e09d961025 Micka=C3=ABl Sala=C3=BCn       2025-11-28  1071  		 * Stops =
at the mount point or the filesystem root for a disconnected
49c9e09d961025 Micka=C3=ABl Sala=C3=BCn       2025-11-28  1072  		 * direct=
ory.
49c9e09d961025 Micka=C3=ABl Sala=C3=BCn       2025-11-28  1073  		 */
49c9e09d961025 Micka=C3=ABl Sala=C3=BCn       2025-11-28  1074  		if (dir =
=3D=3D mnt_root || unlikely(IS_ROOT(dir)))
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1075  			break;
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1076 =20
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1077  		parent_de=
ntry =3D dget_parent(dir);
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1078  		dput(dir);
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1079  		dir =3D p=
arent_dentry;
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1080  	}
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1081  	dput(dir);
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1082  	return ret;
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1083  }
b91c3e4ea756b1 Micka=C3=ABl Sala=C3=BCn       2022-05-06  1084 =20

:::::: The code at line 1043 was first introduced by commit
:::::: b91c3e4ea756b12b7d992529226edce1cfd854d7 landlock: Add support for f=
ile reparenting with LANDLOCK_ACCESS_FS_REFER

:::::: TO: Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>
:::::: CC: Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
