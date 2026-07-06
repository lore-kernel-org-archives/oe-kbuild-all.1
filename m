Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019663EB0EC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 14:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348187; cv=none; b=PlILp3CPExGWJptrn19Q8CkaUpEIi1fLrSoAdKRDZkKMa1QfcElfLkuypvymbwfmX7BPxDwnXhzYZ9SB/VSyBPrbZS7bL0HbgrQvi+5/2kDpOq7HsyfjRKpoyjzFXyOpgk5Ou9c4mPuHEqQmP9RRckK2CKX7dWcjz43jPSHkoWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348187; c=relaxed/simple;
	bh=JtKaZzovdHvnPNQrZ9DbvVpd62DLqFCt6RZ5asyXY9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pVw2sXQVMg8wfa6UbzeSnOUkJfjCJlXD4H0/ZkqvNntrfuwbedlv5Ga/8O/fZubm3f6VLaBZe7NBDj0CyLRWNqV0XYJq/9dsJYKcPq7ROhTRxmUDm/tHgLG+d1RZyuJTW6Bx7GaSjWtDZ+6NLq5n7wq8Le+/J8kl3eLdyiciFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjBPS9dj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjBPS9dj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783348186; x=1814884186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JtKaZzovdHvnPNQrZ9DbvVpd62DLqFCt6RZ5asyXY9E=;
  b=gjBPS9djN2PatfKIuIfS3dORp5P4xL2bSjWEmmr5JxF3z0rQkHk7l8dr
   OvHq4togMg+IOBhkxL/rz7mNxt+iuTY2CS/BVKdmWvFAlD4c/QU4HbnXa
   LJ0N6qKDr5KHsS+bx7uMgJULSKDiBrdBG9soJjKVGwoDROFmaZVOhJdPN
   QGIbsWIVw/CyBjJ5q2P/yT0c2+z1MuNN1gxvsS96r6S85hwngJ2gsKkOQ
   1cYjedwqr/2pOe5QI9vI5PK35qj+NjEA5Jb5tzx9nPrBNZIQmsiJRgI3t
   3m17p0Oc8sVPqNic26fWEDgECU9KeR1yBi3botokLWCfVb51a0Unibir2
   A==;
X-CSE-ConnectionGUID: QhSwG/P2TWO6VAMgda/m1Q==
X-CSE-MsgGUID: jkbMBRdNQyeZY699ByulqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="87900409"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="87900409"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 07:29:46 -0700
X-CSE-ConnectionGUID: O2GW+e2mR1ST4LymiqBzBA==
X-CSE-MsgGUID: 3FadV+OCQaaVRxxwbUlYBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="257309881"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Jul 2026 07:29:45 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgkKM-000000002EH-2BcA;
	Mon, 06 Jul 2026 14:29:42 +0000
Date: Mon, 06 Jul 2026 16:28:45 +0200
From: kernel test robot <lkp@intel.com>
To: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Dileep-Sankhla/staging-media-atomisp-Drop-u?=
 =?us-ascii?Q?nnecessary-else-block-after-return-break/20260706-183345?=
 1/1] checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align
 the * on each line
Message-ID: <202607061616.pKnCleyc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Dileep,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Dileep-Sankhla/staging-media-atomisp-Drop-unnecessary-else-block-after-return-break/20260706-183345
head:   bcb903b3e43406ad5190218f6c9d98a63d22889b
commit: bcb903b3e43406ad5190218f6c9d98a63d22889b [1/1] staging: media: atomisp: Drop unnecessary else block after return/break
reproduce: (https://download.01.org/0day-ci/archive/20260706/202607061616.pKnCleyc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#455: FILE: drivers/staging/media/atomisp/pci/sh_css_params.c:4115:
+		/* A. Calculate dx/dy based on crop region using in_frame_info
+		* Scale the crop region if in_frame_info to the stage is not same as

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
