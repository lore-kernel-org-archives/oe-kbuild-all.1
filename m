Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA64D20A5F5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740225354; cv=none; b=aOrJvwuRyXE4UmuOZO0UmZeYEB+wum/1pZ3PjOss0K28ZMdeqr7qhJ3zf2SuHyOPkVWQYQhN6dB17NarIHqDde8/IJsVAZJfd12NAtQC+JbVgLq8KYgOB1FIItSqbeVFDjz3ub8gJqIXMgIx3ZW1MAQx6Sq/lEJ5tFl58Z3P2YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740225354; c=relaxed/simple;
	bh=AkW+AEWLng/vNDOigab8z/ZbiEALWshD3ErkRGRIC4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dr46TZe9cAHLnAr4HW5V7kQPknPrnPGuHFtbt9VFAzxQ61JaAMLx5rdplZ7dnWsjexBaUeE80P9Jp565ygZohOPK7rNY9w3IC2CiiR7ztdX9KR+nBaDm94DlAQA1keJ+uPKmwTpjOpsaO18teCradouniN+6h+pjVgnjDLeVDN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTP1sSVb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTP1sSVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740225352; x=1771761352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AkW+AEWLng/vNDOigab8z/ZbiEALWshD3ErkRGRIC4M=;
  b=DTP1sSVbTWqpndwI6sSVIk8hwNnJnjfQ0h1jotdEE8fgKuvqdnV2zG2G
   xjs75HMw+H+bMWSPZZ+ig0ujy8+U2uoidW7nsxVomtOJJBsKfiTGkEggI
   s4cFfeH6HHzOHx1qfWxjfquYLB36DtDjcsUjMD4mu6cNUF6ltIWsKJVIB
   nF01bjZI7tyWVyMpguj45/z97HvCAJSxR/MbUTVAY1ODPkr+LybNZuDwF
   FLwi8cXO3fdH/wFl7kx0YWiWFa1G3Hz+hRoDiT++UWchnl4wKOeaZcAMY
   kX7Vaa/r3lzNQvPh4PFb/UuADChaYN/KOglSY/HBXbuIZQYlw8w/Ny2bk
   A==;
X-CSE-ConnectionGUID: mDuZK56kQ9CLpWx5vvMZ7A==
X-CSE-MsgGUID: Jq+n660mQfGsO2Kz7cVTmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="58586219"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="58586219"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 03:55:52 -0800
X-CSE-ConnectionGUID: 9lu63FdUSWm6nc1klrgLcA==
X-CSE-MsgGUID: 4jOd1kxbQO6wYxKeIsAnfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="120704770"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Feb 2025 03:55:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlo6m-0006XJ-2x;
	Sat, 22 Feb 2025 11:55:48 +0000
Date: Sat, 22 Feb 2025 19:55:06 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 21/42]
 security/selinux/avc.c:1286: warning: Function parameter or struct member
 'ad' not described in 'cred_task_has_perm'
Message-ID: <202502221903.misRKmwl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/stephensmalley/selinux-kernel working-selinuxns
head:   8e33da6864e173556431920c74deb653617db98e
commit: 77119259f8191e6ba3a685f094661e48ebd59274 [21/42] selinux: add kerneldoc to new permission checking functions
config: i386-buildonly-randconfig-001-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221903.misRKmwl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221903.misRKmwl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221903.misRKmwl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/selinux/avc.c:1286: warning: Function parameter or struct member 'ad' not described in 'cred_task_has_perm'
>> security/selinux/avc.c:1286: warning: Excess function parameter 'auditdata' description in 'cred_task_has_perm'
>> security/selinux/avc.c:1342: warning: Function parameter or struct member 'ad' not described in 'task_obj_has_perm'
>> security/selinux/avc.c:1342: warning: Excess function parameter 'auditdata' description in 'task_obj_has_perm'
>> security/selinux/avc.c:1401: warning: Function parameter or struct member 'base_perm' not described in 'cred_has_extended_perms'
>> security/selinux/avc.c:1401: warning: Function parameter or struct member 'ad' not described in 'cred_has_extended_perms'
>> security/selinux/avc.c:1401: warning: Excess function parameter 'auditdata' description in 'cred_has_extended_perms'
>> security/selinux/avc.c:1440: warning: Function parameter or struct member 'ad' not described in 'cred_self_has_perm'
>> security/selinux/avc.c:1440: warning: Excess function parameter 'auditdata' description in 'cred_self_has_perm'
   security/selinux/avc.c:1518: warning: Function parameter or struct member 'ad' not described in 'cred_has_perm'
   security/selinux/avc.c:1518: warning: Excess function parameter 'auditdata' description in 'cred_has_perm'
>> security/selinux/avc.c:1605: warning: Function parameter or struct member 'ad' not described in 'cred_ssid_has_perm'
>> security/selinux/avc.c:1605: warning: Excess function parameter 'auditdata' description in 'cred_ssid_has_perm'
>> security/selinux/avc.c:1657: warning: Function parameter or struct member 'ad' not described in 'cred_other_has_perm'
>> security/selinux/avc.c:1657: warning: Excess function parameter 'auditdata' description in 'cred_other_has_perm'


vim +1286 security/selinux/avc.c

aeb4e829ab0112c Stephen Smalley 2024-09-12  1267  
77119259f8191e6 Stephen Smalley 2024-09-30  1268  /**
77119259f8191e6 Stephen Smalley 2024-09-30  1269   * cred_task_has_perm - Check and audit permissions on a (cred, task) pair
77119259f8191e6 Stephen Smalley 2024-09-30  1270   * @cred: subject credentials
77119259f8191e6 Stephen Smalley 2024-09-30  1271   * @p: target task
77119259f8191e6 Stephen Smalley 2024-09-30  1272   * @tclass: target security class
77119259f8191e6 Stephen Smalley 2024-09-30  1273   * @requested: requested permissions, interpreted based on @tclass
77119259f8191e6 Stephen Smalley 2024-09-30  1274   * @auditdata: auxiliary audit data
77119259f8191e6 Stephen Smalley 2024-09-30  1275   *
77119259f8191e6 Stephen Smalley 2024-09-30  1276   * Check permissions between a cred @cred and a task @p for @cred's namespace
77119259f8191e6 Stephen Smalley 2024-09-30  1277   * and all ancestors to determine whether the @requested permissions are
77119259f8191e6 Stephen Smalley 2024-09-30  1278   * granted.
77119259f8191e6 Stephen Smalley 2024-09-30  1279   * Audit the granting or denial of permissions in accordance with the policy.
77119259f8191e6 Stephen Smalley 2024-09-30  1280   * Return %0 if all @requested permissions are granted, -%EACCES if any
77119259f8191e6 Stephen Smalley 2024-09-30  1281   * permissions are denied, or another -errno upon other errors.
77119259f8191e6 Stephen Smalley 2024-09-30  1282   */
aeb4e829ab0112c Stephen Smalley 2024-09-12  1283  int cred_task_has_perm(const struct cred *cred, const struct task_struct *p,
aeb4e829ab0112c Stephen Smalley 2024-09-12  1284  		       u16 tclass, u32 requested,
aeb4e829ab0112c Stephen Smalley 2024-09-12  1285  		       struct common_audit_data *ad)
aeb4e829ab0112c Stephen Smalley 2024-09-12 @1286  {
aeb4e829ab0112c Stephen Smalley 2024-09-12  1287  	struct task_security_struct *tsec;
aeb4e829ab0112c Stephen Smalley 2024-09-12  1288  	struct selinux_state *state;
aeb4e829ab0112c Stephen Smalley 2024-09-12  1289  	u32 ssid;
aeb4e829ab0112c Stephen Smalley 2024-09-12  1290  	u32 tsid;
aeb4e829ab0112c Stephen Smalley 2024-09-12  1291  	int rc;
aeb4e829ab0112c Stephen Smalley 2024-09-12  1292  
aeb4e829ab0112c Stephen Smalley 2024-09-12  1293  	do {
aeb4e829ab0112c Stephen Smalley 2024-09-12  1294  		tsec = selinux_cred(cred);
aeb4e829ab0112c Stephen Smalley 2024-09-12  1295  		ssid = tsec->sid;
aeb4e829ab0112c Stephen Smalley 2024-09-12  1296  		state = tsec->state;
aeb4e829ab0112c Stephen Smalley 2024-09-12  1297  		tsid = task_sid_obj_for_state(p, state);
aeb4e829ab0112c Stephen Smalley 2024-09-12  1298  
aeb4e829ab0112c Stephen Smalley 2024-09-12  1299  		rc = avc_has_perm(state, ssid, tsid, tclass, requested, ad);
aeb4e829ab0112c Stephen Smalley 2024-09-12  1300  		if (rc)
aeb4e829ab0112c Stephen Smalley 2024-09-12  1301  			return rc;
aeb4e829ab0112c Stephen Smalley 2024-09-12  1302  
aeb4e829ab0112c Stephen Smalley 2024-09-12  1303  		cred = tsec->parent_cred;
aeb4e829ab0112c Stephen Smalley 2024-09-12  1304  	} while (cred);
aeb4e829ab0112c Stephen Smalley 2024-09-12  1305  
aeb4e829ab0112c Stephen Smalley 2024-09-12  1306  	return 0;
aeb4e829ab0112c Stephen Smalley 2024-09-12  1307  }
aeb4e829ab0112c Stephen Smalley 2024-09-12  1308  
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1309  static const struct task_security_struct *task_security(
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1310  	const struct task_struct *p)
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1311  {
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1312  	const struct task_security_struct *tsec;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1313  
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1314  	tsec = selinux_cred(__task_cred(p));
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1315  	while (tsec->state != current_selinux_state && tsec->parent_cred)
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1316  		tsec = selinux_cred(tsec->parent_cred);
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1317  	if (tsec->state != current_selinux_state)
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1318  		return NULL;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1319  	return tsec;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1320  }
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1321  
77119259f8191e6 Stephen Smalley 2024-09-30  1322  /**
77119259f8191e6 Stephen Smalley 2024-09-30  1323   * task_obj_has_perm - Check and audit permissions on a (task, other-task) pair
77119259f8191e6 Stephen Smalley 2024-09-30  1324   * @s: source task
77119259f8191e6 Stephen Smalley 2024-09-30  1325   * @t: target task
77119259f8191e6 Stephen Smalley 2024-09-30  1326   * @tclass: target security class
77119259f8191e6 Stephen Smalley 2024-09-30  1327   * @requested: requested permissions, interpreted based on @tclass
77119259f8191e6 Stephen Smalley 2024-09-30  1328   * @auditdata: auxiliary audit data
77119259f8191e6 Stephen Smalley 2024-09-30  1329   *
77119259f8191e6 Stephen Smalley 2024-09-30  1330   * Check permissions between a task @s and a task @t for the current namespace
77119259f8191e6 Stephen Smalley 2024-09-30  1331   * and all ancestors to determine whether the @requested permissions are
77119259f8191e6 Stephen Smalley 2024-09-30  1332   * granted.
77119259f8191e6 Stephen Smalley 2024-09-30  1333   * Audit the granting or denial of permissions in accordance with the policy.
77119259f8191e6 Stephen Smalley 2024-09-30  1334   * Return %0 if all @requested permissions are granted, -%EACCES if any
77119259f8191e6 Stephen Smalley 2024-09-30  1335   * permissions are denied, or another -errno upon other errors.
77119259f8191e6 Stephen Smalley 2024-09-30  1336   * DO NOT USE when @s is current; use cred_task_has_perm() instead.
77119259f8191e6 Stephen Smalley 2024-09-30  1337   */
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1338  int task_obj_has_perm(const struct task_struct *s,
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1339  		      const struct task_struct *t,
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1340  		      u16 tclass, u32 requested,
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1341  		      struct common_audit_data *ad)
0fb44836d9ed1f8 Stephen Smalley 2024-09-27 @1342  {
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1343  	const struct cred *cred;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1344  	const struct task_security_struct *tsec;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1345  	struct selinux_state *state;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1346  	u32 ssid;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1347  	u32 tsid;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1348  	int rc;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1349  
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1350  	state = current_selinux_state;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1351  	rcu_read_lock();
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1352  	tsec = task_security(s);
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1353  	if (tsec)
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1354  		ssid = tsec->sid;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1355  	else
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1356  		ssid = SECINITSID_UNLABELED;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1357  	rcu_read_unlock();
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1358  
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1359  	do {
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1360  		tsid = task_sid_obj_for_state(t, state);
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1361  
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1362  		rc = avc_has_perm(state, ssid, tsid, tclass, requested, ad);
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1363  		if (rc)
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1364  			return rc;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1365  
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1366  		cred = tsec->parent_cred;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1367  		if (!cred)
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1368  			break;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1369  
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1370  		rcu_read_lock();
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1371  		tsec = selinux_cred(cred);
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1372  		ssid = tsec->sid;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1373  		state = tsec->state;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1374  		rcu_read_unlock();
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1375  	} while (cred);
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1376  
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1377  	return 0;
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1378  }
0fb44836d9ed1f8 Stephen Smalley 2024-09-27  1379  
77119259f8191e6 Stephen Smalley 2024-09-30  1380  /**
77119259f8191e6 Stephen Smalley 2024-09-30  1381   * cred_has_extended_perms - Check and audit extended permissions on a (cred, tsid) pair
77119259f8191e6 Stephen Smalley 2024-09-30  1382   * @cred: subject credentials
77119259f8191e6 Stephen Smalley 2024-09-30  1383   * @tsid: target security identifier
77119259f8191e6 Stephen Smalley 2024-09-30  1384   * @tclass: target security class
77119259f8191e6 Stephen Smalley 2024-09-30  1385   * @requested: requested permissions, interpreted based on @tclass
77119259f8191e6 Stephen Smalley 2024-09-30  1386   * @driver: driver value
77119259f8191e6 Stephen Smalley 2024-09-30  1387   * @xperm: extended permission value
77119259f8191e6 Stephen Smalley 2024-09-30  1388   * @auditdata: auxiliary audit data
77119259f8191e6 Stephen Smalley 2024-09-30  1389   *
77119259f8191e6 Stephen Smalley 2024-09-30  1390   * Check extended permissions between a cred @cred and a target
77119259f8191e6 Stephen Smalley 2024-09-30  1391   * security identifier @tsid for @cred's namespace and all ancestors
77119259f8191e6 Stephen Smalley 2024-09-30  1392   * to determine whether the @requested permissions are granted for the
77119259f8191e6 Stephen Smalley 2024-09-30  1393   * specified (@driver, @xperm) pair.
77119259f8191e6 Stephen Smalley 2024-09-30  1394   * Audit the granting or denial of permissions in accordance with the policy.
77119259f8191e6 Stephen Smalley 2024-09-30  1395   * Return %0 if the @requested permissions are granted, -%EACCES if any
77119259f8191e6 Stephen Smalley 2024-09-30  1396   * permissions are denied, or another -errno upon other errors.
77119259f8191e6 Stephen Smalley 2024-09-30  1397   */
dc97fa5a801889b Stephen Smalley 2024-09-23  1398  int cred_has_extended_perms(const struct cred *cred, u32 tsid, u16 tclass,
dc97fa5a801889b Stephen Smalley 2024-09-23  1399  			    u32 requested, u8 driver, u8 base_perm, u8 xperm,
dc97fa5a801889b Stephen Smalley 2024-09-23  1400  			    struct common_audit_data *ad)
dc97fa5a801889b Stephen Smalley 2024-09-23 @1401  {
dc97fa5a801889b Stephen Smalley 2024-09-23  1402  	struct task_security_struct *tsec;
dc97fa5a801889b Stephen Smalley 2024-09-23  1403  	struct selinux_state *state;
dc97fa5a801889b Stephen Smalley 2024-09-23  1404  	u32 ssid;
dc97fa5a801889b Stephen Smalley 2024-09-23  1405  	int rc;
dc97fa5a801889b Stephen Smalley 2024-09-23  1406  
dc97fa5a801889b Stephen Smalley 2024-09-23  1407  	do {
dc97fa5a801889b Stephen Smalley 2024-09-23  1408  		tsec = selinux_cred(cred);
dc97fa5a801889b Stephen Smalley 2024-09-23  1409  		ssid = tsec->sid;
dc97fa5a801889b Stephen Smalley 2024-09-23  1410  		state = tsec->state;
dc97fa5a801889b Stephen Smalley 2024-09-23  1411  
dc97fa5a801889b Stephen Smalley 2024-09-23  1412  		rc = avc_has_extended_perms(state, ssid, tsid, tclass,
dc97fa5a801889b Stephen Smalley 2024-09-23  1413  					    requested, driver, base_perm,
dc97fa5a801889b Stephen Smalley 2024-09-23  1414  					    xperm, ad);
dc97fa5a801889b Stephen Smalley 2024-09-23  1415  		if (rc)
dc97fa5a801889b Stephen Smalley 2024-09-23  1416  			return rc;
dc97fa5a801889b Stephen Smalley 2024-09-23  1417  
dc97fa5a801889b Stephen Smalley 2024-09-23  1418  		cred = tsec->parent_cred;
dc97fa5a801889b Stephen Smalley 2024-09-23  1419  	} while (cred);
dc97fa5a801889b Stephen Smalley 2024-09-23  1420  
dc97fa5a801889b Stephen Smalley 2024-09-23  1421  	return 0;
dc97fa5a801889b Stephen Smalley 2024-09-23  1422  }
dc97fa5a801889b Stephen Smalley 2024-09-23  1423  
77119259f8191e6 Stephen Smalley 2024-09-30  1424  /**
77119259f8191e6 Stephen Smalley 2024-09-30  1425   * cred_self_has_perm - Check and audit permissions on a (cred, self) pair
77119259f8191e6 Stephen Smalley 2024-09-30  1426   * @cred: subject credentials
77119259f8191e6 Stephen Smalley 2024-09-30  1427   * @tclass: target security class
77119259f8191e6 Stephen Smalley 2024-09-30  1428   * @requested: requested permissions, interpreted based on @tclass
77119259f8191e6 Stephen Smalley 2024-09-30  1429   * @auditdata: auxiliary audit data
77119259f8191e6 Stephen Smalley 2024-09-30  1430   *
77119259f8191e6 Stephen Smalley 2024-09-30  1431   * Check permissions between a cred @cred and itself for @cred's namespace
77119259f8191e6 Stephen Smalley 2024-09-30  1432   * and all ancestors to determine whether the @requested permissions are
77119259f8191e6 Stephen Smalley 2024-09-30  1433   * granted.
77119259f8191e6 Stephen Smalley 2024-09-30  1434   * Audit the granting or denial of permissions in accordance with the policy.
77119259f8191e6 Stephen Smalley 2024-09-30  1435   * Return %0 if all @requested permissions are granted, -%EACCES if any
77119259f8191e6 Stephen Smalley 2024-09-30  1436   * permissions are denied, or another -errno upon other errors.
77119259f8191e6 Stephen Smalley 2024-09-30  1437   */
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1438  int cred_self_has_perm(const struct cred *cred, u16 tclass, u32 requested,
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1439  		       struct common_audit_data *ad)
a1cd8aa391eebc6 Stephen Smalley 2024-09-24 @1440  {
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1441  	struct task_security_struct *tsec;
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1442  	struct selinux_state *state;
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1443  	u32 ssid;
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1444  	int rc;
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1445  
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1446  	do {
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1447  		tsec = selinux_cred(cred);
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1448  		ssid = tsec->sid;
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1449  		state = tsec->state;
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1450  		rc = avc_has_perm(state, ssid, ssid, tclass, requested, ad);
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1451  		if (rc)
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1452  			return rc;
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1453  
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1454  		cred = tsec->parent_cred;
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1455  	} while (cred);
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1456  
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1457  	return 0;
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1458  }
a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1459  

:::::: The code at line 1286 was first introduced by commit
:::::: aeb4e829ab0112c58dc9bbb1a5ac1358ddef46b1 selinux: introduce cred_task_has_perm()

:::::: TO: Stephen Smalley <stephen.smalley.work@gmail.com>
:::::: CC: Stephen Smalley <stephen.smalley.work@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
