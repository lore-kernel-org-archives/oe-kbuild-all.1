Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2808C8BF3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 19:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678302838; x=1709838838;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AGel+5dJ9Xv3fAbQkhM3VfvIQyC3remBjcNgUdN3Ym4=;
  b=GaNlZQcFpk3ZtER0mcJHGBsKfUUepVNySMle2jVz5sILvZ6yopw7Q98i
   fEpFQXVUufrklZtvX+lHuiGAyUfpLra96HAJ9vSeS/4fgnNM8IOKAxsDI
   Myi+bcFIDL6XnmYIVTWrgJdsYgxSMbKmZx2x/GSRf4YRc63ekJ6jCQ2IC
   bja93rye0CQzheJJ2fbcVcoHAlm52cXA5UGbPIGTF99dcm3cotUhTSLsF
   nep3PwCQ2Tg37iof2pVlGefATjPhP0jtxPuzoT17h9oF8uDPd4b8W9YyG
   Dp2VK5hTqq8GGQaMlNZ2kMVqSCDXpFolGAG2jgDE6gMQKmu6QM9nYgNZ8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="338586716"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="338586716"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 11:13:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="707317801"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="707317801"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Mar 2023 11:13:56 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZzEZ-0002Lx-2e;
	Wed, 08 Mar 2023 19:13:55 +0000
Date: Thu, 09 Mar 2023 03:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Liam Howlett <Liam.Howlett@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+65 bytes kernel size regression] [i386-tinyconfig]
 [70fb15c893] maple_tree: be more cautious about dead nodes
Message-ID: <6408de3e.cyiAo4/R79asg9lw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +65 bytes kernel size regression due to commit:

commit: 70fb15c8932fd97d535f4da3f69055ebda1e6def (maple_tree: be more cautious about dead nodes)
https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-unstable


Details as below (size data is obtained by `nm --size-sort vmlinux`):

a3a345d0: mm/rmap: use atomic_try_cmpxchg in set_tlb_ubc_flush_pending
70fb15c8: maple_tree: be more cautious about dead nodes

+---------------------+----------+----------+-------+
|       symbol        | a3a345d0 | 70fb15c8 | delta |
+---------------------+----------+----------+-------+
| bzImage             | 501696   | 501792   | 96    |
| nm.t.mas_next_node  | 316      | 342      | 26    |
| nm.t.mas_prev_node  | 385      | 409      | 24    |
| nm.t.mas_data_end   | 73       | 83       | 10    |
| nm.t.ma_data_end    | 48       | 57       | 9     |
| nm.t.mas_ascend     | 351      | 354      | 3     |
| nm.t.mas_prev_entry | 299      | 292      | -7    |
+---------------------+----------+----------+-------+



Thanks

