Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B403DA5A8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781636752; cv=none; b=jgcAvJ5FbtcqWnOqrb3o+eev6mQaPaDmkl372AZ8EouR4vvfYWPxJigRt2nHEM/AovlZfHvZ/tX/WOMsMAJilQhj9DM3aXjNsOvYQN9FdaVUX5UtjgIm0r6q6Ui3CshuAoXFgSd1XvrOPB+9U2buS+gBX9kzMT72kNDWd0TjLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781636752; c=relaxed/simple;
	bh=SMPliSZE+MkXpOgl/VWlgOqDI9W+kbb9scQyWs2Inc8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PrK+LE8wL6utyDY2zFwhkD4k/67V/07dFJMiURgdLQRNL2Fhx871aLD8/T9ijS3YcVoEIJFdLdEpUBNF8ldOhPrPF39krBLT4L+mb6V9eWCEpdg+3G2kFqpMtmQI3JRxy33TmVe36jOe+nFkkkYB+WQXbkX6SxRhJFa18Ds/0wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHczr9Aq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHczr9Aq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781636750; x=1813172750;
  h=date:from:to:cc:subject:message-id;
  bh=SMPliSZE+MkXpOgl/VWlgOqDI9W+kbb9scQyWs2Inc8=;
  b=iHczr9AqFqeWJejCXzkLAGhvn0XEXKHkkhU72kPUPiS9yuFQXfYN3dcO
   kPTjoAHilNgvrhF2iSftBmEu5qlW4EIoqu6MRN9QvoWTQvubWntcTSyJR
   cSNEaf6Bpa52Ji3KCEye9V1QOeQaveRgNqi6sJqm7RRtmwq9QcdBNCySF
   jqy2RB//bgcwfZWjH1VLzE6H64kqDIH6k0C1X4jXUn5dfwEL/kqke6HTp
   tUwTURWX8s0+CjEWqT+21LdtVrhEy1Euz0PYfVHMLPzCiA5pk/r6HiJif
   /iqVL+AnUUgEOYW43KN7R3MvSRTGv5fUli1KNSJI9tr7tDrOxgMMl/DqR
   Q==;
X-CSE-ConnectionGUID: FYjOYmVdRF+YQZVb3sddcw==
X-CSE-MsgGUID: jROwRt+BQp6J8MXfiyyd3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82457682"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82457682"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 12:05:49 -0700
X-CSE-ConnectionGUID: wh3xOBPTRva7uIsupiwp/A==
X-CSE-MsgGUID: D5tME/rLSuq86p9sHtQZQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="271931855"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2026 12:05:44 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZZ6T-00000000Teo-3Jum;
	Tue, 16 Jun 2026 19:05:41 +0000
Date: Wed, 17 Jun 2026 03:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Lee <ryan.lee@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 John Johansen <john.johansen@canonical.com>,
 Georgia Garcia <georgia.garcia@canonical.com>
Subject: [linux-next:master 13520/14023]
 security/apparmor/domain.c:1158:62: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202606170235.hEvZRsLB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
commit: 32e92764d6f8d251c1bca62be33793287b453a81 [13520/14023] apparmor: grab ns lock and refresh when looking up changehat child profiles
config: powerpc-randconfig-r122-20260615 (https://download.01.org/0day-ci/archive/20260617/202606170235.hEvZRsLB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170235.hEvZRsLB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606170235.hEvZRsLB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/apparmor/domain.c:1158:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct aa_profile *p @@     got struct aa_profile [noderef] __rcu *parent @@
   security/apparmor/domain.c:1158:62: sparse:     expected struct aa_profile *p
   security/apparmor/domain.c:1158:62: sparse:     got struct aa_profile [noderef] __rcu *parent

vim +1158 security/apparmor/domain.c

  1103	
  1104	/* helper fn for changing into a hat
  1105	 *
  1106	 * Returns: label for hat transition or ERR_PTR. Does not return NULL
  1107	 */
  1108	static struct aa_label *change_hat(const struct cred *subj_cred,
  1109					   struct aa_label *label, const char *hats[],
  1110					   int count, int flags)
  1111	{
  1112		struct aa_profile *profile, *root, *hat = NULL;
  1113		struct aa_ns *ns, *new_ns;
  1114		struct aa_label *new;
  1115		struct label_it it;
  1116		bool sibling = false;
  1117		const char *name, *info = NULL;
  1118		int i, error;
  1119	
  1120		AA_BUG(!label);
  1121		AA_BUG(!hats);
  1122		AA_BUG(count < 1);
  1123	
  1124		/*
  1125		 * Acquire the newest label and then hold the lock until we choose a
  1126		 * hat, so that profile replacement doesn't atomically truncate the
  1127		 * list of potential hats. Because we are getting the namespaces from
  1128		 * the profiles and label, we can rely on the namespaces being live
  1129		 * and avoid incrementing their refcounts while grabbing the lock.
  1130		 */
  1131		label = aa_get_label(label);
  1132		ns = labels_ns(label);
  1133	
  1134	retry:
  1135		mutex_lock_nested(&ns->lock, ns->level);
  1136		if (label_is_stale(label)) {
  1137			new = aa_get_newest_label(label);
  1138			new_ns = labels_ns(new);
  1139			if (new_ns != ns) {
  1140				aa_put_label(new);
  1141				mutex_unlock(&ns->lock);
  1142				ns = new_ns;
  1143				label = new;
  1144				goto retry;
  1145			}
  1146			aa_put_label(label);
  1147			label = new;
  1148		}
  1149	
  1150		if (PROFILE_IS_HAT(labels_profile(label)))
  1151			sibling = true;
  1152	
  1153		/*find first matching hat */
  1154		for (i = 0; i < count && !hat; i++) {
  1155			name = hats[i];
  1156			label_for_each_in_scope(it, labels_ns(label), label, profile) {
  1157				if (sibling && PROFILE_IS_HAT(profile)) {
> 1158					root = aa_get_profile(profile->parent);
  1159				} else if (!sibling && !PROFILE_IS_HAT(profile)) {
  1160					root = aa_get_profile(profile);
  1161				} else {	/* conflicting change type */
  1162					info = "conflicting targets types";
  1163					error = -EPERM;
  1164					goto fail;
  1165				}
  1166				hat = aa_find_child(root, name);
  1167				aa_put_profile(root);
  1168				if (!hat) {
  1169					if (!COMPLAIN_MODE(profile))
  1170						goto outer_continue;
  1171					/* complain mode succeed as if hat */
  1172				} else if (!PROFILE_IS_HAT(hat)) {
  1173					info = "target not hat";
  1174					error = -EPERM;
  1175					aa_put_profile(hat);
  1176					goto fail;
  1177				}
  1178				aa_put_profile(hat);
  1179			}
  1180			/* found a hat for all profiles in ns */
  1181			goto build;
  1182	outer_continue:
  1183		;
  1184		}
  1185		/* no hats that match, find appropriate error
  1186		 *
  1187		 * In complain mode audit of the failure is based off of the first
  1188		 * hat supplied.  This is done due how userspace interacts with
  1189		 * change_hat.
  1190		 */
  1191		name = NULL;
  1192		label_for_each_in_scope(it, labels_ns(label), label, profile) {
  1193			if (!list_empty(&profile->base.profiles)) {
  1194				info = "hat not found";
  1195				error = -ENOENT;
  1196				goto fail;
  1197			}
  1198		}
  1199		info = "no hats defined";
  1200		error = -ECHILD;
  1201	
  1202	fail:
  1203		label_for_each_in_scope(it, labels_ns(label), label, profile) {
  1204			/*
  1205			 * no target as it has failed to be found or built
  1206			 *
  1207			 * change_hat uses probing and should not log failures
  1208			 * related to missing hats
  1209			 */
  1210			/* TODO: get rid of GLOBAL_ROOT_UID */
  1211			if (count > 1 || COMPLAIN_MODE(profile)) {
  1212				aa_audit_file(subj_cred, profile, &nullperms,
  1213					      OP_CHANGE_HAT,
  1214					      AA_MAY_CHANGEHAT, name, NULL, NULL,
  1215					      GLOBAL_ROOT_UID, info, error);
  1216			}
  1217		}
  1218		mutex_unlock(&ns->lock);
  1219		return ERR_PTR(error);
  1220	
  1221	build:
  1222		new = fn_label_build_in_scope(label, profile, GFP_KERNEL,
  1223					   build_change_hat(subj_cred, profile, name,
  1224							    sibling),
  1225					   aa_get_label(&profile->label));
  1226		if (!new) {
  1227			info = "label build failed";
  1228			error = -ENOMEM;
  1229			goto fail;
  1230		} /* else if (IS_ERR) build_change_hat has logged error so return new */
  1231		mutex_unlock(&ns->lock);
  1232		return new;
  1233	}
  1234	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
