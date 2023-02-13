Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8574F8F5F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 16:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676305348; x=1707841348;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Mm88jsx2a5EEyU3aKpWOnOofHk5JoD/sDHAIzFzMaOY=;
  b=Bkkl8BACpzkEI0Ig2KE6f8TFNW57LcIQJOfHhCSkA8vbEJj8HMT1ePqr
   OjzaDQyEMKLYfw+ogdmZoqwTep0Qh9nbMXNKGamt/XmILSZ/W9HQGtFXc
   jzEYw/hYlt7LORHf5+XAFkLCB/a/o+QknGuFn0LRTNqF+3yJq9hJcRQ1F
   Y0C7C21P0+RiS9yvk+lKIRDVC4Hm9bDmz0FeWCbWP5MMmL1mcgrVjsYho
   k+APAkuP0Ks8WPfs8/LVmCRf4DDNKS7ivTrH9teSbES/6dBrLsy/V5klX
   Pr4WFIh7Hee6xF7OMj7nt9ak3JXmv0PHWKfy0QP82F/OEgkTSZVZwFBEG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="314569736"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="314569736"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 08:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="811643511"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="811643511"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2023 08:22:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRbaz-0007rl-0y;
	Mon, 13 Feb 2023 16:22:25 +0000
Date: Tue, 14 Feb 2023 00:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+547 bytes kernel size regression] [i386-tinyconfig]
 [929bad88e0] splice: Fix O_DIRECT file read splice to avoid reversion of
 ITER_PIPE
Message-ID: <63ea63b7.y4YY5lB3uDgtlJY6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +547 bytes kernel size regression due to commit:

commit: 929bad88e01fe3741170eb3c2faace578fae1ef6 (splice: Fix O_DIRECT file read splice to avoid reversion of ITER_PIPE)
https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-extract-3


Details as below (size data is obtained by `nm --size-sort vmlinux`):

4ec5183e: Linux 6.2-rc7
929bad88: splice: Fix O_DIRECT file read splice to avoid reversion of ITER_PIPE

+--------------------------------------+----------+----------+-------+
|                symbol                | 4ec5183e | 929bad88 | delta |
+--------------------------------------+----------+----------+-------+
| nm.t.generic_file_direct_splice_read | 0        | 515      | 515   |
| bzImage                              | 495936   | 496288   | 352   |
| nm.T.generic_file_splice_read        | 169      | 200      | 31    |
| nm.D.linux_banner                    | 165      | 166      | 1     |
+--------------------------------------+----------+----------+-------+



Thanks

