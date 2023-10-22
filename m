Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BE7613C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 21:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YylSirf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698008652; x=1729544652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OyNVocgYcad+oUWIITV9GRqh1gqlO4dx70JXq4lKbGk=;
  b=YylSirf1tq+4v133gX2GeQEN9f8KMH0GHv1IlySg3xkFqZeVzhaAW7sg
   AwK+TTwsP0noQ9sqWnRwRLfba10z0M6047wC2cFNCrAXVZbXrPbptbpsY
   XWrh6w/4oEI4ORY1JPwbu2BRrUK5raLIqocI5adFUEy1WVO2RJl0fh47k
   TI9KKuP9B2c2Kvdx06KAblA0X5BHqQCc6RZU9Yavctqo7UKcF/6qhfz9T
   rR5oHrO2UdryAuaNOJLvBqXJz9+u5bXCDdQsmagsftGd+Zyrx1sq2damq
   YOU7Nty+8TRZNTQY0bac+olM+0HNapO1H4C4rRtM2buYBBK9QWsPj1nGP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="5355154"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="5355154"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 14:04:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="787290215"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="787290215"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Oct 2023 14:04:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qufcF-0006GM-2Q;
	Sun, 22 Oct 2023 21:04:07 +0000
Date: Mon, 23 Oct 2023 05:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tytso-ext4:dev 26/41] checkpatch: WARNING: Block comments use * on
 subsequent lines
Message-ID: <202310230406.7Gcze0fM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   c388da1dad59dc24801b61bc63539cab6cd83e23
commit: 484fd6c1de13b336806a967908a927cc0356e312 [26/41] ext4: apply umask if ACL support is disabled
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230406.7Gcze0fM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230406.7Gcze0fM-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#36: FILE: fs/ext4/acl.h:72:
+	/* usually, the umask is applied by posix_acl_create(), but if
+	   ext4 ACL support is disabled at compile time, we need to do

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#37: FILE: fs/ext4/acl.h:73:
+	   it here, because posix_acl_create() will never be called */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
