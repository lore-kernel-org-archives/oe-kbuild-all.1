Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8062F1114
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 11:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753614475; cv=none; b=YgecQETau8CxGvQT2JfnQDIGRmVN4BEvnoD0vq1VeArjSvwAnv6E4hWJ+/OjeWXvKowP+JbJgiP361eCMmkMOFLBW0SZBquIKkrkWIv2bv73sL7zf8tD00byaa8juGG99HoepsXeliEbuVirPzowIpVwUKWH4Zo5JIkzwFGshiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753614475; c=relaxed/simple;
	bh=QG8cUAhMCpsfS9/eMYmTrNZGiCuA2EeC8PdxUapA/MI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQTZWd+KXzxP+MUNcdJc+6dFdoi6vbdTywEkcTTS63MebQ9qYpm/aqn9nWpe+CfIlsqWl5bPDzRPxh4ujKIyt8YdJSHO5jSlq39k9vKwi050hJPfSvrSz2QgecouBylCP5PhIadNEtczhY1jwNPN5/yKmGGOcOc5EVpud/Q3lB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=An7XtosS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="An7XtosS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753614473; x=1785150473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QG8cUAhMCpsfS9/eMYmTrNZGiCuA2EeC8PdxUapA/MI=;
  b=An7XtosStRrpTSlMs5m7M0IBsAon1QW+NPuF66raSJQTlhsy3T+RctQQ
   bjCxOfCH6m+x8bSRALOHSQt0hHX+vD88BoxHrFllbNXeAmIHW3CPU3pe/
   p4nGUXE3stqKW4glTLq7e5WxvY03GW2vcAsaRQTqHQrbnTaA+M2EFXekC
   Hx5PnxruTnIA1v6Gw+NDtoisxlRFs+LRsvpZBuDlUNGkMpYPNGoJeTQ6F
   3TRVDk0sDV1pCRHDm85aPLEiZ167cHMdVm6EFDwB35B8cluuPcnHZLpZP
   BwVL1on1e15C4QKmT5LSMOTTPtfgdfpQMaZk2l/MjphvxxUtDQyz5Xl1u
   A==;
X-CSE-ConnectionGUID: sNo5ix28TDW4Ft+wdL8qIg==
X-CSE-MsgGUID: /w6PXlzRTyuq8ITmOGCIEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="54961987"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="54961987"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 04:07:52 -0700
X-CSE-ConnectionGUID: RSpcHml5T+2wV7pViumk9Q==
X-CSE-MsgGUID: vnubjcPnQMq7TOpcmMiIVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161718377"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 27 Jul 2025 04:07:51 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufzEL-0000Q3-0Q;
	Sun, 27 Jul 2025 11:07:49 +0000
Date: Sun, 27 Jul 2025 13:07:13 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/sequencer 17/21] compile_commands.json: warning: ignored
 by one of the .gitignore files
Message-ID: <202507271358.iFtoypu4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/sequencer
head:   efd8e94c58549652d19874d6aa484f3072fc2339
commit: 08a51c9fc7ed55daa379d41748f34cc213fe5e63 [17/21] JOEL: Add LSM metadata
config: s390-randconfig-2003-20250719 (https://download.01.org/0day-ci/archive/20250727/202507271358.iFtoypu4-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507271358.iFtoypu4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507271358.iFtoypu4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .pylintrc: warning: ignored by one of the .gitignore files
>> compile_commands.json: warning: ignored by one of the .gitignore files
>> rust-project.json: warning: ignored by one of the .gitignore files
>> scripts/target.json: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
