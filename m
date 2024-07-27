Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC55B662
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722099515; cv=none; b=JBpxpTwvBkXn/vpfGThPZle2TceXiRemSLaVJyvA41mlQxs3zFa0gyi8/UB2WWXuaH3EW0uuoV7LA7CcZGVfGaiTLR08NayV6NfyWKQD7u9ut9PjzkoWSVAw+WFypy35fYXqmd08xpK6RjlsXj4Zodmniq1FjfbkOtPNN+lEkQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722099515; c=relaxed/simple;
	bh=/gATgnDiH2sWScRZMNkHpoAEmnd61ZuWPeBzqbvXj48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PjVYiPyg5vUBcuIUCQtE/vwDoNAu9EdYr0QG35BOIVYetnqiTGdeCqLAaCUl9R2B+u3xdKFh3SiqRJQJ4rbGbf5o52RGka6r9fvt2PytnuO5PU2O8JcjzIzuTvMGlOajJp/3IduZXDPQeEUmbdc2r+BS3w39sGurt+M0UIuWbxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7gxuRFl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7gxuRFl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722099513; x=1753635513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/gATgnDiH2sWScRZMNkHpoAEmnd61ZuWPeBzqbvXj48=;
  b=L7gxuRFl/Ri2lewru+0/cnmJqh3naM5RlOdVvBpeNqp2sXwINs7kb0u3
   LXhu83TVHCWfw6HnBjsaPWzPTsAtYshI6TGjGaCGEAv3rZhY1uDJXeoV4
   MRzE2gG3xO3lgBMqmKeZ5BMipON46HgV5n+IMC6Lmo8VGsw+xzJHHD4Ad
   8ZY1wKGk9Js1ncH7mflv1NRjrN25H+Mv3O6vPZNb2tmcnCzaGeAULm+LW
   e+jSBBJMEt5fluGzAMgeA/OZGBZ4TLzBsDvNVeiNBmjtDVwcz2clVQqV3
   LSAFgwyu6yEUNYt4zvsiGTpVr+aLtmV2Ffj4X7FBMNVZmcjiQRHEMzMVr
   Q==;
X-CSE-ConnectionGUID: ODkU98cpSZuhahSjSZCgag==
X-CSE-MsgGUID: vNbufZFUS26HDlDhvEjFEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="31285410"
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="31285410"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 09:58:32 -0700
X-CSE-ConnectionGUID: u8xuczmCRF+TCVjxGBOKsA==
X-CSE-MsgGUID: 2tFtOviORWCLadQGe+o3zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="53456832"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jul 2024 09:58:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXkkX-000q5Q-0v;
	Sat, 27 Jul 2024 16:58:29 +0000
Date: Sun, 28 Jul 2024 00:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: [broonie-misc:arm64-gcs 35/50] arch/arm64/kernel/signal.c:1098:40:
 error: 'struct thread_struct' has no member named 'gcs_el0_mode'
Message-ID: <202407280047.Pc2oqiM3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git arm64-gcs
head:   553099e072d8b6e5b6ebba3f17d1f27288564f80
commit: 93e7eb4f848feb737b0b465cf2585b42d1716092 [35/50] arm64/signal: Expose GCS state in signal frames
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240728/202407280047.Pc2oqiM3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407280047.Pc2oqiM3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407280047.Pc2oqiM3-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/signal.c: In function 'setup_sigframe_layout':
>> arch/arm64/kernel/signal.c:1098:40: error: 'struct thread_struct' has no member named 'gcs_el0_mode'
    1098 |             (add_all || current->thread.gcs_el0_mode)) {
         |                                        ^


vim +1098 arch/arm64/kernel/signal.c

  1069	
  1070	/*
  1071	 * Determine the layout of optional records in the signal frame
  1072	 *
  1073	 * add_all: if true, lays out the biggest possible signal frame for
  1074	 *	this task; otherwise, generates a layout for the current state
  1075	 *	of the task.
  1076	 */
  1077	static int setup_sigframe_layout(struct rt_sigframe_user_layout *user,
  1078					 bool add_all)
  1079	{
  1080		int err;
  1081	
  1082		if (system_supports_fpsimd()) {
  1083			err = sigframe_alloc(user, &user->fpsimd_offset,
  1084					     sizeof(struct fpsimd_context));
  1085			if (err)
  1086				return err;
  1087		}
  1088	
  1089		/* fault information, if valid */
  1090		if (add_all || current->thread.fault_code) {
  1091			err = sigframe_alloc(user, &user->esr_offset,
  1092					     sizeof(struct esr_context));
  1093			if (err)
  1094				return err;
  1095		}
  1096	
  1097		if (system_supports_gcs() &&
> 1098		    (add_all || current->thread.gcs_el0_mode)) {
  1099			err = sigframe_alloc(user, &user->gcs_offset,
  1100					     sizeof(struct gcs_context));
  1101			if (err)
  1102				return err;
  1103		}
  1104	
  1105		if (system_supports_sve() || system_supports_sme()) {
  1106			unsigned int vq = 0;
  1107	
  1108			if (add_all || current->thread.fp_type == FP_STATE_SVE ||
  1109			    thread_sm_enabled(&current->thread)) {
  1110				int vl = max(sve_max_vl(), sme_max_vl());
  1111	
  1112				if (!add_all)
  1113					vl = thread_get_cur_vl(&current->thread);
  1114	
  1115				vq = sve_vq_from_vl(vl);
  1116			}
  1117	
  1118			err = sigframe_alloc(user, &user->sve_offset,
  1119					     SVE_SIG_CONTEXT_SIZE(vq));
  1120			if (err)
  1121				return err;
  1122		}
  1123	
  1124		if (system_supports_tpidr2()) {
  1125			err = sigframe_alloc(user, &user->tpidr2_offset,
  1126					     sizeof(struct tpidr2_context));
  1127			if (err)
  1128				return err;
  1129		}
  1130	
  1131		if (system_supports_sme()) {
  1132			unsigned int vl;
  1133			unsigned int vq = 0;
  1134	
  1135			if (add_all)
  1136				vl = sme_max_vl();
  1137			else
  1138				vl = task_get_sme_vl(current);
  1139	
  1140			if (thread_za_enabled(&current->thread))
  1141				vq = sve_vq_from_vl(vl);
  1142	
  1143			err = sigframe_alloc(user, &user->za_offset,
  1144					     ZA_SIG_CONTEXT_SIZE(vq));
  1145			if (err)
  1146				return err;
  1147		}
  1148	
  1149		if (system_supports_sme2()) {
  1150			if (add_all || thread_za_enabled(&current->thread)) {
  1151				err = sigframe_alloc(user, &user->zt_offset,
  1152						     ZT_SIG_CONTEXT_SIZE(1));
  1153				if (err)
  1154					return err;
  1155			}
  1156		}
  1157	
  1158		if (system_supports_fpmr()) {
  1159			err = sigframe_alloc(user, &user->fpmr_offset,
  1160					     sizeof(struct fpmr_context));
  1161			if (err)
  1162				return err;
  1163		}
  1164	
  1165		return sigframe_alloc_end(user);
  1166	}
  1167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
