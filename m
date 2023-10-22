Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA456133
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 16:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAGq55DJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697991182; x=1729527182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uK0fgHWWp2IkNRoJ4AIqrP9Vl81mZyTNC/Ddfc8En60=;
  b=kAGq55DJmgMtNHx1eiqDkMHxpbp+TEEZVNAhAlZ7kfHSMoxMWzW2x6Ld
   L5As2VuSjc7pcRkZtzX7BE5M1PJAmR+ioWKqzGyxjY7ETsmPDtJvhY4ei
   woGIJh5TO5iQInKsI4sxjeu6lGMJ0drUEYbsFsX0I4ARc6OpslMTOaaKg
   f9WB/0nQKKHAQRLQNkS97prgT0a6XXicN2zlxfqIk09GUlfW2nrDdeqTi
   A4KKTZ99jh3C2uRRmqri5sLvI1nJ/oiAZQLvmSUi92R/LdbzL2jMNnoZ9
   OU4iLXWIh8jAMZbci/Wkvdw2XlnNDpmGO0kLwVnrY1i4wsETF6SdhMaQt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="472931708"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="472931708"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 09:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="881521768"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="881521768"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Oct 2023 09:13:00 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qub4T-00064w-1x;
	Sun, 22 Oct 2023 16:12:57 +0000
Date: Mon, 23 Oct 2023 00:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fgraph-multi 3/15] checkpatch: WARNING: braces {}
 are not necessary for single statement blocks
Message-ID: <202310230045.UQMPTPFZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fgraph-multi
head:   7b4f1147ab12cc7de50a7a15d6a818b02a0e4fa2
commit: 235c778d489b69addce14b2fd9da088bb6c21156 [3/15] function_graph: Add an array structure that will allow multiple callbacks
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230045.UQMPTPFZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230045.UQMPTPFZ-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for single statement blocks
#104: FILE: kernel/trace/fgraph.c:675:
+		for (i = 0; i < FGRAPH_ARRAY_SIZE; i++) {
+			fgraph_array[i] = &fgraph_stub;
+		}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
