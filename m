Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19781331A4C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778328124; cv=none; b=a++ctbMs6EEvPQRYz69tionq/8IkczqgBdueMpCkTAH5x5LL0Epo3H9WfNyINAwVSeWKIKWPuBZe10w6UUlXOxkiw1u/HW/P569mSVHRtVmqnhaJqIdYiGEYBTAvaF5W62OZrp31mFpmFsFpDO0vefemH3DjSMsduMVF9tw/cT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778328124; c=relaxed/simple;
	bh=rE4uulBSXBHalKPIdhHDMAAHa4UyjoyayLDcvpEpXQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nZvpyXhpK5nZ9zVzyU4AqRUnak9m9tV3+jcOz7sJ5ANaa5+dQkaphfrLzkZBQ1A8R+Jq4XvK9SxVZdAT0GqTfm4k7AE1VgA/WjtlD24q060/7vSvVjthmi/ZgOBUGUfF/ofrYdFwEZ73/Ft2dqdTNi1iOvuU8xSlh6sORfbCrCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpJuizRm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpJuizRm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778328123; x=1809864123;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rE4uulBSXBHalKPIdhHDMAAHa4UyjoyayLDcvpEpXQU=;
  b=HpJuizRmsLwSds6b6rri5rAsJs9n5gh3k3unqEE2wX0EccKxuM5Aiqw/
   7AX/08KU2ZMBuKpppcDPIUUzFFQqO6DAN8D5ewOcnExgwmq5j/WXqmV0t
   tGaHmHHYYUMaXVC0Da2CLfCLeIaRhDWYZxl5R3jBoULQ6ZiS43uYtE5ph
   umyV0We95dN1AvTK0BFFL6LHrESg1NOi/fEPtHTELEQayvnmyiR93zIBG
   5+igdKx+QxEnWo8H+GCVgqaeLJvdlsqJ8/zHDOYkeI9uIiQ73iMmIZ93T
   cULgsa2oBjJWgos7BxTA8Uwt5+9M7IDYLj09EApx0/A9IuqxDIdtVNDvc
   Q==;
X-CSE-ConnectionGUID: rYUI7WycR/2imcG8TN9HrQ==
X-CSE-MsgGUID: W6EBlXjOTVSHappndgrf3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="96712266"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="96712266"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 05:02:00 -0700
X-CSE-ConnectionGUID: 0D86GTw4TmyQojO/4O+lKg==
X-CSE-MsgGUID: u/ZyfhLgT+uN7V2m7RF3UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="232671860"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2026 05:01:57 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLgNX-000000000wN-1TH0;
	Sat, 09 May 2026 12:01:55 +0000
Date: Sat, 09 May 2026 20:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [kees:for-next/kmalloc_obj 3/4]
 security/landlock/ruleset.c:140:9: warning: 'memcpy' accessing 4294967295
 bytes at offsets 20 and 0 overlaps 6442450943 bytes at offset -2147483648
Message-ID: <202605092028.gKnpMbid-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-=
next/kmalloc_obj
head:   795469820c638b4449f3bb90ee5e98ebccfbc480
commit: 4b44cbb264d0ed3f2f2bc2659db6ce45882f4670 [3/4] overflow: Make sure =
size helpers are always inlined
config: microblaze-randconfig-r131-20260509 (https://download.01.org/0day-c=
i/archive/20260509/202605092028.gKnpMbid-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260509/202605092028.gKnpMbid-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605092028.gKnpMbid-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   security/landlock/ruleset.c: In function 'create_rule':
>> security/landlock/ruleset.c:140:9: warning: 'memcpy' accessing 429496729=
5 bytes at offsets 20 and 0 overlaps 6442450943 bytes at offset -2147483648=
 [-Wrestrict]
     140 |         memcpy(new_rule->layers, layers,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     141 |                flex_array_size(new_rule, layers, num_layers));
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memcpy +140 security/landlock/ruleset.c

a4ac404b303256 Konstantin Meskhidze 2023-10-26  108 =20
06a1c40a09a8dd Micka=C3=ABl Sala=C3=BCn       2022-05-06  109  static struc=
t landlock_rule *
a4ac404b303256 Konstantin Meskhidze 2023-10-26  110  create_rule(const stru=
ct landlock_id id,
06a1c40a09a8dd Micka=C3=ABl Sala=C3=BCn       2022-05-06  111  	    const s=
truct landlock_layer (*const layers)[], const u32 num_layers,
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  112  	    const s=
truct landlock_layer *const new_layer)
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  113  {
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  114  	struct land=
lock_rule *new_rule;
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  115  	u32 new_num=
_layers;
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  116 =20
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  117  	build_check=
_rule();
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  118  	if (new_lay=
er) {
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  119  		/* Should =
already be checked by landlock_merge_ruleset(). */
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  120  		if (WARN_O=
N_ONCE(num_layers >=3D LANDLOCK_MAX_NUM_LAYERS))
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  121  			return ER=
R_PTR(-E2BIG);
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  122  		new_num_la=
yers =3D num_layers + 1;
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  123  	} else {
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  124  		new_num_la=
yers =3D num_layers;
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  125  	}
69050f8d6d075d Kees Cook            2026-02-20  126  	new_rule =3D kzalloc_=
flex(*new_rule, layers, new_num_layers,
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  127  				GFP_KERN=
EL_ACCOUNT);
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  128  	if (!new_ru=
le)
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  129  		return ERR=
_PTR(-ENOMEM);
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  130  	RB_CLEAR_NO=
DE(&new_rule->node);
a4ac404b303256 Konstantin Meskhidze 2023-10-26  131  	if (is_object_pointer=
(id.type)) {
143c9aae043a1d Tanya Agarwal        2025-01-24  132  		/* This should have =
been caught by insert_rule(). */
a4ac404b303256 Konstantin Meskhidze 2023-10-26  133  		WARN_ON_ONCE(!id.key=
.object);
a4ac404b303256 Konstantin Meskhidze 2023-10-26  134  		landlock_get_object(=
id.key.object);
a4ac404b303256 Konstantin Meskhidze 2023-10-26  135  	}
a4ac404b303256 Konstantin Meskhidze 2023-10-26  136 =20
a4ac404b303256 Konstantin Meskhidze 2023-10-26  137  	new_rule->key =3D id.=
key;
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  138  	new_rule->n=
um_layers =3D new_num_layers;
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  139  	/* Copies t=
he original layer stack. */
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22 @140  	memcpy(new_=
rule->layers, layers,
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  141  	       flex=
_array_size(new_rule, layers, num_layers));
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  142  	if (new_lay=
er)
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  143  		/* Adds a =
copy of @new_layer on the layer stack. */
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  144  		new_rule->=
layers[new_rule->num_layers - 1] =3D *new_layer;
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  145  	return new_=
rule;
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  146  }
ae271c1b14de34 Micka=C3=ABl Sala=C3=BCn       2021-04-22  147 =20

:::::: The code at line 140 was first introduced by commit
:::::: ae271c1b14de343b888e77f74f640e3dcbdeb4c9 landlock: Add ruleset and d=
omain management

:::::: TO: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
:::::: CC: James Morris <jamorris@linux.microsoft.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
