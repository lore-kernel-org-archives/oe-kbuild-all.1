Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2391DF754
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 20:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738182106; cv=none; b=cxgxOT/9p2J845TobxLm031lUQq0ZmY5TKbKo1yMKlFZi1Hzlys2T/zMQ47IRAwXJjBII9CgwoA2Q5kEExJVhFE6+8+73UOSvrOrCwM48sv1EK0q3qGHFUd0TL5QWXiYsgq1va01oTDFaabOFsd4kl94UK0YQOH0QRMFCBpvJWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738182106; c=relaxed/simple;
	bh=gWvE/2+YZBZFDLZofXu+HpSO/LVgEO2fU7ZePeG0J54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KxOso1h5RRCxbiTwdo9BxfWrwK2pjXT5ZQyr0H4KtBfhdswjjQPaFxd2RnLRC9zp8UbZebCtb+h9h/VAD6XhB9MqYJGpZZk25b0+xVtL61cOx8oYL0JDqchR1b7a7Ljq6dvP7c2FPI1lgqJqleymPY2FmRmmTu7chVc+g47uzfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mkz3KUx1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mkz3KUx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738182104; x=1769718104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gWvE/2+YZBZFDLZofXu+HpSO/LVgEO2fU7ZePeG0J54=;
  b=Mkz3KUx1iS4d+p7+8jr6UjLw57096vd3iM90JX444sLMPihHeiTx1bDe
   JAK8R941vsCca0iTl5FQ9zrCMIU+LZv3bcqPgMoFrFxbLjDFGFsylPLcE
   q6ybHsmlLHAQFgSCe0Hbu+fW4R5PBcnRDPkyeySd4SMz1woPp4quhUoFA
   rejNIWuAt+rdZN2RetmduYn7sNmT4WVgxlRIfZO4xLf4ARynIdV6dU1J3
   17PQtwSQG4uix2HrquCVdTo+1lR4X7qZ2Wxq9AaYhfYjXYsALZ531ywUY
   j1OS48HmTqS2brjl7CsXRut0uHyMCXnBTqnEzxnnqYj0B4tixxPPk2FoD
   w==;
X-CSE-ConnectionGUID: +MTr3zgHTh222x8SOozpKQ==
X-CSE-MsgGUID: +GElYxukTHyWo1pHMvMQxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="26318293"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="26318293"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 12:21:43 -0800
X-CSE-ConnectionGUID: 2vUL0r+fQFGaakzbcaZyTg==
X-CSE-MsgGUID: YJM6bikqTXCOn6WgaaSKpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108990399"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jan 2025 12:21:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdEZ9-000jJR-23;
	Wed, 29 Jan 2025 20:21:39 +0000
Date: Thu, 30 Jan 2025 04:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [linux-next:master 10281/10552]
 drivers/gpu/drm/xe/xe_guc_ct.c:1727:58: error: format '%lx' expects argument
 of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned
 int'}
Message-ID: <202501300452.jyFY6MAQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da7e6047a6264af16d2cb82bed9b6caa33eaf56a
commit: cb1f868ca13756c0c18ba54d1591332476760d07 [10281/10552] drm/xe: Make GUC binaries dump consistent with other binaries in devcoredump
config: i386-randconfig-141-20250130 (https://download.01.org/0day-ci/archive/20250130/202501300452.jyFY6MAQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300452.jyFY6MAQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300452.jyFY6MAQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_guc_ct.c: In function 'xe_guc_ct_snapshot_print':
>> drivers/gpu/drm/xe/xe_guc_ct.c:1727:58: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
    1727 |                         drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
         |                                                        ~~^     ~~~~~~~~~~~~~~~~~~
         |                                                          |             |
         |                                                          |             size_t {aka unsigned int}
         |                                                          long unsigned int
         |                                                        %x
   cc1: all warnings being treated as errors
--
   drivers/gpu/drm/xe/xe_guc_log.c: In function 'xe_guc_log_snapshot_print':
>> drivers/gpu/drm/xe/xe_guc_log.c:207:42: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
     207 |         drm_printf(p, "[LOG].length: 0x%lx\n", snapshot->size);
         |                                        ~~^     ~~~~~~~~~~~~~~
         |                                          |             |
         |                                          |             size_t {aka unsigned int}
         |                                          long unsigned int
         |                                        %x
   cc1: all warnings being treated as errors


vim +1727 drivers/gpu/drm/xe/xe_guc_ct.c

  1703	
  1704	/**
  1705	 * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
  1706	 * @snapshot: GuC CT snapshot object.
  1707	 * @p: drm_printer where it will be printed out.
  1708	 *
  1709	 * This function prints out a given GuC CT snapshot object.
  1710	 */
  1711	void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
  1712				      struct drm_printer *p)
  1713	{
  1714		if (!snapshot)
  1715			return;
  1716	
  1717		if (snapshot->ct_enabled) {
  1718			drm_puts(p, "H2G CTB (all sizes in DW):\n");
  1719			guc_ctb_snapshot_print(&snapshot->h2g, p);
  1720	
  1721			drm_puts(p, "G2H CTB (all sizes in DW):\n");
  1722			guc_ctb_snapshot_print(&snapshot->g2h, p);
  1723			drm_printf(p, "\tg2h outstanding: %d\n",
  1724				   snapshot->g2h_outstanding);
  1725	
  1726			if (snapshot->ctb) {
> 1727				drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
  1728				xe_print_blob_ascii85(p, "[CTB].data", '\n',
  1729						      snapshot->ctb, 0, snapshot->ctb_size);
  1730			}
  1731		} else {
  1732			drm_puts(p, "CT disabled\n");
  1733		}
  1734	}
  1735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
