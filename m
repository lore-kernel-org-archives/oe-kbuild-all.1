Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E28416F0E1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 23:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719011429; cv=none; b=jvjwoxL0e28cN1s93NzKYBJQX/qj8YVB6IdIXFPJ3hgxv3A+HZslmstyUxhqeip67zB1rIEK75YM0Up4SEWYVAU9wTb/b854dSk0vIEHg12Q6lIxJYjiV3EdMmcWjh2Nbe5FchHU/Zq+7SdARU3Pca0hIiWZ4XBAW0+Rj0tACdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719011429; c=relaxed/simple;
	bh=6VvJIiqtPcTS6sdxjZwfOrOBGF9I5dl/MUdhWSuQ0jw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pqUXP4+mhz6516bAf0Tj0KsP8EbnZLZu7UU+9cKupLerhYZHiTDaomKzRMScEbAbca4o1cuiX45ypQbw9eAeeMaXzhbn2c7X0K9QmqeCQ/UMQgJUxa1SKSJvWOfl2TDlKOpAN7K7Z4G48ThaFB6ORzJgjuwpmR9v0r/+Yj2yE0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WF4M2MjR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WF4M2MjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719011428; x=1750547428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6VvJIiqtPcTS6sdxjZwfOrOBGF9I5dl/MUdhWSuQ0jw=;
  b=WF4M2MjRPHv48t1XCF/BFhRprw0bgI2nW6sAeT5IUgG+v0C8+4oE7etH
   F543+W64pl6TAnUv88s8JdUW+yepyvekaCeSsISuBoQvs3FKHEIIPHj4Z
   sWrU0NGO50Ug48Rp2NenEqKb33ypdRELwI6fug86MXYUxRsDIcVOJX4gJ
   032X+5Xv8Mu0jtgxTHKRS3rQPT+A/wVTFGr5mrqw5PbC0bitgS+6Y19Ah
   oObtYF0I5EK5tN1ftvthLR+iaj9JGaBb0VH7AJkhe14FIqf87fLGgedkp
   StxepMk3L2cQKOy9fwBHUlugOIN/Ux8v73p1+Cd9+O90TfZ2jPTTIJZD7
   g==;
X-CSE-ConnectionGUID: K5gxLAU8T4aMQl+h1s3j7Q==
X-CSE-MsgGUID: pcOr41MQSFe8si+TkeAMJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="38582433"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="38582433"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 16:10:27 -0700
X-CSE-ConnectionGUID: OQKENDD7RGi5xk0zpnwyBQ==
X-CSE-MsgGUID: EIXzfnf8TsSoVfbPNHc0Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="42698086"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jun 2024 16:10:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKnOh-00096k-19;
	Fri, 21 Jun 2024 23:10:23 +0000
Date: Sat, 22 Jun 2024 07:10:06 +0800
From: kernel test robot <lkp@intel.com>
To: James Chapman <jchapman@katalix.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tom Parkin <tparkin@katalix.com>
Subject: [linux-next:master 7577/7797] net/l2tp/l2tp_core.c:1298:9: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202406220754.evK8Hrjw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f76698bd9a8ca01d3581236082d786e9a6b72bb7
commit: d18d3f0a24fc4a3513495892ab1a3753628b341b [7577/7797] l2tp: replace hlist with simple list for per-tunnel session list
config: i386-randconfig-062-20240622 (https://download.01.org/0day-ci/archive/20240622/202406220754.evK8Hrjw-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406220754.evK8Hrjw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220754.evK8Hrjw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/l2tp/l2tp_core.c:1298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct list_head const *list @@     got struct list_head [noderef] __rcu *pos @@
   net/l2tp/l2tp_core.c:1298:9: sparse:     expected struct list_head const *list
   net/l2tp/l2tp_core.c:1298:9: sparse:     got struct list_head [noderef] __rcu *pos
>> net/l2tp/l2tp_core.c:1298:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct list_head [noderef] __rcu *pos @@     got struct list_head *next @@
   net/l2tp/l2tp_core.c:1298:9: sparse:     expected struct list_head [noderef] __rcu *pos
   net/l2tp/l2tp_core.c:1298:9: sparse:     got struct list_head *next
>> net/l2tp/l2tp_core.c:1299:27: sparse: sparse: cast removes address space '__rcu' of expression
>> net/l2tp/l2tp_core.c:1298:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct list_head [noderef] __rcu *pos @@     got struct list_head *[assigned] tmp @@
   net/l2tp/l2tp_core.c:1298:9: sparse:     expected struct list_head [noderef] __rcu *pos
   net/l2tp/l2tp_core.c:1298:9: sparse:     got struct list_head *[assigned] tmp
   net/l2tp/l2tp_core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
>> net/l2tp/l2tp_core.c:1298:9: sparse: sparse: dereference of noderef expression
>> net/l2tp/l2tp_core.c:1298:9: sparse: sparse: dereference of noderef expression

vim +1298 net/l2tp/l2tp_core.c

  1287	
  1288	/* When the tunnel is closed, all the attached sessions need to go too.
  1289	 */
  1290	static void l2tp_tunnel_closeall(struct l2tp_tunnel *tunnel)
  1291	{
  1292		struct l2tp_session *session;
  1293		struct list_head __rcu *pos;
  1294		struct list_head *tmp;
  1295	
  1296		spin_lock_bh(&tunnel->list_lock);
  1297		tunnel->acpt_newsess = false;
> 1298		list_for_each_safe(pos, tmp, &tunnel->session_list) {
> 1299			session = list_entry(pos, struct l2tp_session, list);
  1300			list_del_init(&session->list);
  1301			spin_unlock_bh(&tunnel->list_lock);
  1302			l2tp_session_delete(session);
  1303			spin_lock_bh(&tunnel->list_lock);
  1304		}
  1305		spin_unlock_bh(&tunnel->list_lock);
  1306	}
  1307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
