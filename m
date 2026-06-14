Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1436179A3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 21:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781472296; cv=none; b=XYwAYOUSCD6f+QgZ0RN3Ww+AlRUHrk3TkzDvzdkjxKY0hsxokX6s6XWAzUJ0ZZJ+pWcae1qZBkz3bFUzdZWngBGhC+C9Y+tzpyLiwUpJo7fQRKG3KRtROXrwnrO47d79MGZ7ETTxzrEcht+Foua0nuhcVO7bFGeINO1pnZwGzFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781472296; c=relaxed/simple;
	bh=TL0OohvQasLVTXj1dgjimksYW+bfGtDnwt0LZnlqe48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M9tmt5V33m4a++r2zag61Oz1GWDXqYYsIYCbihSC5R1TDxzsCUKhSq1CC2GjP3khg/GRSaXKMfvq/YyEU5aIXglZpwHqTEtD7f6QsqPWsg6h19PC1lD+dCJevj9wgm9gAvVRg7KcEYxhIoBPp9XF+B/cWbcB7VTVj5ovL+rhNSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQu6BImp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQu6BImp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781472293; x=1813008293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TL0OohvQasLVTXj1dgjimksYW+bfGtDnwt0LZnlqe48=;
  b=aQu6BImpxqSEepkEVTgp7V7Xu223SkSgOrguJMlhg6IlT3295XL77Vt/
   oIaTDYWhnbPOYrZrqdaPV0UzA7agup8iab5tt1AQz6e6RKipWiZY/AEat
   H+t6mUv8DfZH4fXPqwES5gaCsZfFRrx7IqsS0h4MLvFDybBxKjpCqYxjl
   LXdxjBWeRWEkn0MgWOKp2Gf65UBTA53T33dectUtcRPJnoTsz0qW25NXR
   nXycJsostCMxsRrIzfSiU26+zkOEE87p+jLzH6xgqtMR1PI3xTawnrtRA
   AGwK+RANVaPqegemd0ZtEzfm6nm6xwV90oXByVMlhkPzRuLvzphWC/wa5
   Q==;
X-CSE-ConnectionGUID: XPfNtDe3QcCz+f/Qb3hYhA==
X-CSE-MsgGUID: lqAgfJeVRIeNAQo/olVUGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82064123"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82064123"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 14:24:53 -0700
X-CSE-ConnectionGUID: S/w0Pf+VR3ih9Gf9vd03kA==
X-CSE-MsgGUID: /ch7n52YShisH/t5yM6DDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="240954682"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2026 14:24:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYsK0-00000000RDK-4BOX;
	Sun, 14 Jun 2026 21:24:48 +0000
Date: Mon, 15 Jun 2026 05:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Maxime =?utf-8?Q?B=C3=A9lair"?= <maxime.belair@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 John Johansen <john.johansen@canonical.com>,
 Georgia Garcia <georgia.garcia@canonical.com>
Subject: [jj-apparmor:apparmor-next 15/32]
 security/apparmor/policy.c:1381:2: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <202606150525.npax8WiH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   d0691bd5dcaec2350039ecb04fa70faa91ac142d
commit: 7b42f95813dc9ceb6bda35afcf914630909a19f9 [15/32] apparmor: fix potential UAF in aa_replace_profiles
config: sparc64-randconfig-001-20260615 (https://download.01.org/0day-ci/archive/20260615/202606150525.npax8WiH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150525.npax8WiH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150525.npax8WiH-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/apparmor/policy.c: In function 'aa_replace_profiles':
>> security/apparmor/policy.c:1381:2: error: a label can only be part of a statement and a declaration is not a statement
     ssize_t udata_sz = udata->size;
     ^~~~~~~


vim +1381 security/apparmor/policy.c

  1154	
  1155	/**
  1156	 * aa_replace_profiles - replace profile(s) on the profile list
  1157	 * @policy_ns: namespace load is occurring on
  1158	 * @label: label that is attempting to load/replace policy
  1159	 * @mask: permission mask
  1160	 * @udata: serialized data stream  (NOT NULL)
  1161	 *
  1162	 * unpack and replace a profile on the profile list and uses of that profile
  1163	 * by any task creds via invalidating the old version of the profile, which
  1164	 * tasks will notice to update their own cred.  If the profile does not exist
  1165	 * on the profile list it is added.
  1166	 *
  1167	 * Returns: size of data consumed else error code on failure.
  1168	 */
  1169	ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
  1170				    u32 mask, struct aa_loaddata *udata)
  1171	{
  1172		const char *ns_name = NULL, *info = NULL;
  1173		struct aa_ns *ns = NULL;
  1174		struct aa_load_ent *ent, *tmp;
  1175		struct aa_loaddata *rawdata_ent;
  1176		const char *op;
  1177		ssize_t count, error;
  1178		LIST_HEAD(lh);
  1179	
  1180		op = mask & AA_MAY_REPLACE_POLICY ? OP_PROF_REPL : OP_PROF_LOAD;
  1181		aa_get_profile_loaddata(udata);
  1182		/* released below */
  1183		error = aa_unpack(udata, &lh, &ns_name);
  1184		if (error)
  1185			goto out;
  1186	
  1187		/* ensure that profiles are all for the same ns
  1188		 * TODO: update locking to remove this constraint. All profiles in
  1189		 *       the load set must succeed as a set or the load will
  1190		 *       fail. Sort ent list and take ns locks in hierarchy order
  1191		 */
  1192		count = 0;
  1193		list_for_each_entry(ent, &lh, list) {
  1194			if (ns_name) {
  1195				if (ent->ns_name &&
  1196				    strcmp(ent->ns_name, ns_name) != 0) {
  1197					info = "policy load has mixed namespaces";
  1198					error = -EACCES;
  1199					goto fail;
  1200				}
  1201			} else if (ent->ns_name) {
  1202				if (count) {
  1203					info = "policy load has mixed namespaces";
  1204					error = -EACCES;
  1205					goto fail;
  1206				}
  1207				ns_name = ent->ns_name;
  1208				ent->ns_name = NULL;
  1209			} else
  1210				count++;
  1211		}
  1212		if (ns_name) {
  1213			ns = aa_prepare_ns(policy_ns ? policy_ns : labels_ns(label),
  1214					   ns_name);
  1215			if (IS_ERR(ns)) {
  1216				op = OP_PROF_LOAD;
  1217				info = "failed to prepare namespace";
  1218				error = PTR_ERR(ns);
  1219				ns = NULL;
  1220				ent = NULL;
  1221				goto fail;
  1222			}
  1223		} else
  1224			ns = aa_get_ns(policy_ns ? policy_ns : labels_ns(label));
  1225	
  1226		mutex_lock_nested(&ns->lock, ns->level);
  1227		/* check for duplicate rawdata blobs: space and file dedup */
  1228		if (!list_empty(&ns->rawdata_list)) {
  1229			list_for_each_entry(rawdata_ent, &ns->rawdata_list, list) {
  1230				if (aa_rawdata_eq(rawdata_ent, udata)) {
  1231					struct aa_loaddata *tmp;
  1232	
  1233					tmp = aa_get_profile_loaddata(rawdata_ent);
  1234					/* check we didn't fail the race */
  1235					if (tmp) {
  1236						aa_put_profile_loaddata(udata);
  1237						udata = tmp;
  1238						break;
  1239					}
  1240				}
  1241			}
  1242		}
  1243		/* setup parent and ns info */
  1244		list_for_each_entry(ent, &lh, list) {
  1245			struct aa_policy *policy;
  1246			struct aa_profile *p;
  1247	
  1248			if (aa_g_export_binary)
  1249				ent->new->rawdata = aa_get_profile_loaddata(udata);
  1250			error = __lookup_replace(ns, ent->new->base.hname,
  1251						 !(mask & AA_MAY_REPLACE_POLICY),
  1252						 &ent->old, &info);
  1253			if (error)
  1254				goto fail_lock;
  1255	
  1256			if (ent->new->rename) {
  1257				error = __lookup_replace(ns, ent->new->rename,
  1258							!(mask & AA_MAY_REPLACE_POLICY),
  1259							&ent->rename, &info);
  1260				if (error)
  1261					goto fail_lock;
  1262			}
  1263	
  1264			/* released when @new is freed */
  1265			ent->new->ns = aa_get_ns(ns);
  1266	
  1267			if (ent->old || ent->rename)
  1268				continue;
  1269	
  1270			/* no ref on policy only use inside lock */
  1271			p = NULL;
  1272			policy = __lookup_parent(ns, ent->new->base.hname);
  1273			if (!policy) {
  1274				/* first check for parent in the load set */
  1275				p = __list_lookup_parent(&lh, ent->new);
  1276				if (!p) {
  1277					/*
  1278					 * fill in missing parent with null
  1279					 * profile that doesn't have
  1280					 * permissions. This allows for
  1281					 * individual profile loading where
  1282					 * the child is loaded before the
  1283					 * parent, and outside of the current
  1284					 * atomic set. This unfortunately can
  1285					 * happen with some userspaces.  The
  1286					 * null profile will be replaced once
  1287					 * the parent is loaded.
  1288					 */
  1289					policy = __create_missing_ancestors(ns,
  1290								ent->new->base.hname,
  1291								GFP_KERNEL);
  1292					if (!policy) {
  1293						error = -ENOENT;
  1294						info = "parent does not exist";
  1295						goto fail_lock;
  1296					}
  1297				}
  1298			}
  1299			if (!p && policy != &ns->base)
  1300				/* released on profile replacement or free_profile */
  1301				p = (struct aa_profile *) policy;
  1302			rcu_assign_pointer(ent->new->parent, aa_get_profile(p));
  1303		}
  1304	
  1305		/* create new fs entries for introspection if needed */
  1306		if (!udata->dents[AAFS_LOADDATA_DIR] && aa_g_export_binary) {
  1307			error = __aa_fs_create_rawdata(ns, udata);
  1308			if (error) {
  1309				info = "failed to create raw_data dir and files";
  1310				ent = NULL;
  1311				goto fail_lock;
  1312			}
  1313		}
  1314		list_for_each_entry(ent, &lh, list) {
  1315			if (!ent->old) {
  1316				struct dentry *parent;
  1317				if (rcu_access_pointer(ent->new->parent)) {
  1318					struct aa_profile *p;
  1319					p = aa_deref_parent(ent->new);
  1320					parent = prof_child_dir(p);
  1321				} else
  1322					parent = ns_subprofs_dir(ent->new->ns);
  1323				error = __aafs_profile_mkdir(ent->new, parent);
  1324			}
  1325	
  1326			if (error) {
  1327				info = "failed to create";
  1328				goto fail_lock;
  1329			}
  1330		}
  1331	
  1332		/* Done with checks that may fail - do actual replacement */
  1333		__aa_bump_ns_revision(ns);
  1334		if (aa_g_export_binary)
  1335			__aa_loaddata_update(udata, ns->revision);
  1336		list_for_each_entry_safe(ent, tmp, &lh, list) {
  1337			list_del_init(&ent->list);
  1338			op = (!ent->old && !ent->rename) ? OP_PROF_LOAD : OP_PROF_REPL;
  1339	
  1340			if (ent->old && ent->old->rawdata == ent->new->rawdata &&
  1341			    ent->new->rawdata) {
  1342				/* dedup actual profile replacement */
  1343				audit_policy(label, op, ns_name, ent->new->base.hname,
  1344					     "same as current profile, skipping",
  1345					     error);
  1346				/* break refcount cycle with proxy. */
  1347				aa_put_proxy(ent->new->label.proxy);
  1348				ent->new->label.proxy = NULL;
  1349				goto skip;
  1350			}
  1351	
  1352			/*
  1353			 * TODO: finer dedup based on profile range in data. Load set
  1354			 * can differ but profile may remain unchanged
  1355			 */
  1356			audit_policy(label, op, ns_name, ent->new->base.hname, NULL,
  1357				     error);
  1358	
  1359			if (ent->old) {
  1360				share_name(ent->old, ent->new);
  1361				__replace_profile(ent->old, ent->new);
  1362			} else {
  1363				struct list_head *lh;
  1364	
  1365				if (rcu_access_pointer(ent->new->parent)) {
  1366					struct aa_profile *parent;
  1367	
  1368					parent = update_to_newest_parent(ent->new);
  1369					lh = &parent->base.profiles;
  1370				} else
  1371					lh = &ns->base.profiles;
  1372				__add_profile(lh, ent->new);
  1373			}
  1374		skip:
  1375			aa_load_ent_free(ent);
  1376		}
  1377		__aa_labelset_update_subtree(ns);
  1378		mutex_unlock(&ns->lock);
  1379	
  1380	out:
> 1381		ssize_t udata_sz = udata->size;
  1382	
  1383		aa_put_ns(ns);
  1384		aa_put_profile_loaddata(udata);
  1385		kfree(ns_name);
  1386	
  1387		if (error)
  1388			return error;
  1389		return udata_sz;
  1390	
  1391	fail_lock:
  1392		mutex_unlock(&ns->lock);
  1393	
  1394		/* audit cause of failure */
  1395		op = (ent && !ent->old) ? OP_PROF_LOAD : OP_PROF_REPL;
  1396	fail:
  1397		  audit_policy(label, op, ns_name, ent ? ent->new->base.hname : NULL,
  1398			       info, error);
  1399		/* audit status that rest of profiles in the atomic set failed too */
  1400		info = "valid profile in failed atomic policy load";
  1401		list_for_each_entry(tmp, &lh, list) {
  1402			if (tmp == ent) {
  1403				info = "unchecked profile in failed atomic policy load";
  1404				/* skip entry that caused failure */
  1405				continue;
  1406			}
  1407			op = (!tmp->old) ? OP_PROF_LOAD : OP_PROF_REPL;
  1408			audit_policy(label, op, ns_name, tmp->new->base.hname, info,
  1409				     error);
  1410		}
  1411		list_for_each_entry_safe(ent, tmp, &lh, list) {
  1412			list_del_init(&ent->list);
  1413			aa_load_ent_free(ent);
  1414		}
  1415	
  1416		goto out;
  1417	}
  1418	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
