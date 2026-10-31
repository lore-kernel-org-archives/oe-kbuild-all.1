Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442530;
	b=4hKidwYnDto9cim5pnNKLe6gfZ+aRJe9nKNBhCk2GpGZd1dJR8O6GmQxXPDTVxKbzJlS
	 wwbvkzCIGGsikcEqgLVRSfag4L1BaMPT+Y+r9gNiOEbJ8jNMguwBeFoITxGMkZ3EQ9FEp
	 tfxp2kV9Az0ymnXnLFZsYpl3TM5D8f2na4xM5+RBTvjqXOFPZsJYIRcvMKTeNKWU4Sj/q
	 ufQ8Qml8W91YWKJG+GZ5NrvCbdJO2PnFXtrWINVu61no6Xt8yXg4gJvzqG6K0p1fY8mZM
	 Dny/UMqglKAUlBVEEOBHmYYdftB5C365km7gOX6L8iewZhwVwBmnFV1o3xqkiWEKwVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442530;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=O+mivv5MXptm//Z0/qm3tUAacP6YwyQ1wpjMP8eQgrI=;
	b=cLApRPKkfrn9w+/Me73bZ6uB69Fw2V6AS4fh+tJVPwLEkdiYXNrUu9PpIlvROF2dQ+d6
	 QisbWGdWjUFXxIEfInvdDpbriL0VLxfdght55+5Uw6LoXbK3rht4/d8FynN/cgf1MEVG7
	 oulwK2lT1hfJqkkM0sCEPpeL7fn609i/05nEmvu+U7XsfUtDJKfRAr0ESUINuw6sARty+
	 e3ywZBF30ufmWDbzoZK2Ap5fno/oKNEgpl/UbFmpwxwWIvi3y56WMQRRYP7P8RjdlNwCZ
	 AKaQvnxs8qx/8Kq4BnrrxfvprruQmpvrzndLUlpEzzKgcR56TG/4TOmrsw02CMO3t0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LQ4eyGGy;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89D606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 10:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A89D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LQ4eyGGy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793442528; x=1824978528;
  h=date:from:to:cc:subject:message-id;
  bh=4rwCCLWvCggWmhgjRhBKN9e5wpwQi4kID41+Kv/K2NU=;
  b=LQ4eyGGyU3CpHG2D2LK9Gg0di0wn6i6SZ8XS3yP4y5OAbf2GIRfZ/PSc
   TDMJm9BaCDRdOmBA30YxQiUPnkSj6yT7utRVhDhprLsnj+0AK7FlnarBB
   EEnIdZ2pE+jct1xETdOh4TNMEz/CdLG72Qi0jp04QJ5jXrhsgf7r0BBJm
   OrmE6hNvreYJXwaUNNIIDY2fQ2iilp7k3PgmcW22GAwDdMbwb0+Pd60DD
   RGrQo0TJECx+R55vn9o738JPm/Rp6edM+8Flx30nXonv88bPpUMAsWF40
   m/J9cYIFwO1CYAQlSvI8xEmlkBSh1lChyH4zMDqYF3AWNKYOFlLh9wIuj
   w==;
X-CSE-ConnectionGUID: vCP+uuMkQ0S+b3lcT7rE6Q==
X-CSE-MsgGUID: fvJiR8w6QsuFtPAKewpRmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2190952"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2190952"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 03:28:47 -0700
X-CSE-ConnectionGUID: pU0pEqh1RkeUpTF8NwPN+w==
X-CSE-MsgGUID: 4IdpDeucSjmhpW9CPNG/bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5521322"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 31 Oct 2026 03:28:45 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN6KJ-000000005xj-0pUy;
	Sat, 31 Oct 2026 10:28:43 +0000
Date: Sat, 31 Oct 2026 11:27:50 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2026-10 0/1]
 security/apparmor/domain.c:1086:62: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202610311109.DlIIk6TC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-5.15-2026-10
head:   58f1957f262fb6c032d5094a13003c605aa35774
commit: 65f95c1e7ce70bf339504e22473879e02026cfc4 [0/1] apparmor: grab ns lock and refresh when looking up changehat child profiles
config: i386-randconfig-2302-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311109.DlIIk6TC-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311109.DlIIk6TC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311109.DlIIk6TC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/apparmor/domain.c:1086:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct aa_profile *p @@     got struct aa_profile [noderef] __rcu *parent @@
   security/apparmor/domain.c:1086:62: sparse:     expected struct aa_profile *p
   security/apparmor/domain.c:1086:62: sparse:     got struct aa_profile [noderef] __rcu *parent

vim +1086 security/apparmor/domain.c

  1032	
  1033	/* helper fn for changing into a hat
  1034	 *
  1035	 * Returns: label for hat transition or ERR_PTR. Does not return NULL
  1036	 */
  1037	static struct aa_label *change_hat(struct aa_label *label, const char *hats[],
  1038					   int count, int flags)
  1039	{
  1040		struct aa_profile *profile, *root, *hat = NULL;
  1041		struct aa_ns *ns, *new_ns;
  1042		struct aa_label *new;
  1043		struct label_it it;
  1044		bool sibling = false;
  1045		const char *name, *info = NULL;
  1046		int i, error;
  1047	
  1048		AA_BUG(!label);
  1049		AA_BUG(!hats);
  1050		AA_BUG(count < 1);
  1051	
  1052		/*
  1053		 * Acquire the newest label and then hold the lock until we choose a
  1054		 * hat, so that profile replacement doesn't atomically truncate the
  1055		 * list of potential hats. Because we are getting the namespaces from
  1056		 * the profiles and label, we can rely on the namespaces being live
  1057		 * and avoid incrementing their refcounts while grabbing the lock.
  1058		 */
  1059		label = aa_get_label(label);
  1060		ns = labels_ns(label);
  1061	
  1062	retry:
  1063		mutex_lock_nested(&ns->lock, ns->level);
  1064		if (label_is_stale(label)) {
  1065			new = aa_get_newest_label(label);
  1066			new_ns = labels_ns(new);
  1067			if (new_ns != ns) {
  1068				aa_put_label(new);
  1069				mutex_unlock(&ns->lock);
  1070				ns = new_ns;
  1071				label = new;
  1072				goto retry;
  1073			}
  1074			aa_put_label(label);
  1075			label = new;
  1076		}
  1077	
  1078		if (PROFILE_IS_HAT(labels_profile(label)))
  1079			sibling = true;
  1080	
  1081		/*find first matching hat */
  1082		for (i = 0; i < count && !hat; i++) {
  1083			name = hats[i];
  1084			label_for_each_in_ns(it, labels_ns(label), label, profile) {
  1085				if (sibling && PROFILE_IS_HAT(profile)) {
> 1086					root = aa_get_profile(profile->parent);
  1087				} else if (!sibling && !PROFILE_IS_HAT(profile)) {
  1088					root = aa_get_profile(profile);
  1089				} else {	/* conflicting change type */
  1090					info = "conflicting targets types";
  1091					error = -EPERM;
  1092					goto fail;
  1093				}
  1094				hat = aa_find_child(root, name);
  1095				aa_put_profile(root);
  1096				if (!hat) {
  1097					if (!COMPLAIN_MODE(profile))
  1098						goto outer_continue;
  1099					/* complain mode succeed as if hat */
  1100				} else if (!PROFILE_IS_HAT(hat)) {
  1101					info = "target not hat";
  1102					error = -EPERM;
  1103					aa_put_profile(hat);
  1104					goto fail;
  1105				}
  1106				aa_put_profile(hat);
  1107			}
  1108			/* found a hat for all profiles in ns */
  1109			goto build;
  1110	outer_continue:
  1111		;
  1112		}
  1113		/* no hats that match, find appropriate error
  1114		 *
  1115		 * In complain mode audit of the failure is based off of the first
  1116		 * hat supplied.  This is done due how userspace interacts with
  1117		 * change_hat.
  1118		 */
  1119		name = NULL;
  1120		label_for_each_in_ns(it, labels_ns(label), label, profile) {
  1121			if (!list_empty(&profile->base.profiles)) {
  1122				info = "hat not found";
  1123				error = -ENOENT;
  1124				goto fail;
  1125			}
  1126		}
  1127		info = "no hats defined";
  1128		error = -ECHILD;
  1129	
  1130	fail:
  1131		label_for_each_in_ns(it, labels_ns(label), label, profile) {
  1132			/*
  1133			 * no target as it has failed to be found or built
  1134			 *
  1135			 * change_hat uses probing and should not log failures
  1136			 * related to missing hats
  1137			 */
  1138			/* TODO: get rid of GLOBAL_ROOT_UID */
  1139			if (count > 1 || COMPLAIN_MODE(profile)) {
  1140				aa_audit_file(profile, &nullperms, OP_CHANGE_HAT,
  1141					      AA_MAY_CHANGEHAT, name, NULL, NULL,
  1142					      GLOBAL_ROOT_UID, info, error);
  1143			}
  1144		}
  1145		mutex_unlock(&ns->lock);
  1146		return ERR_PTR(error);
  1147	
  1148	build:
  1149		new = fn_label_build_in_ns(label, profile, GFP_KERNEL,
  1150					   build_change_hat(profile, name, sibling),
  1151					   aa_get_label(&profile->label));
  1152		if (!new) {
  1153			info = "label build failed";
  1154			error = -ENOMEM;
  1155			goto fail;
  1156		} /* else if (IS_ERR) build_change_hat has logged error so return new */
  1157		mutex_unlock(&ns->lock);
  1158		return new;
  1159	}
  1160	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
