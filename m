Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9598A29CA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 13:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675776683; x=1707312683;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qlE+ryg5Ao9Azq3oEjIrVPfzOYWpION6Be7VjZ9H9e4=;
  b=dX2Tx6B6zxcT0qDIMgWMw93pK7fZtXwoobXl8HR5mJi50PTPl1pTzpfe
   VRHEGANsZpZMZphmRPp/pBw22GwsUBAVbrEzqXcpNnlXvubpShNqRVvfE
   C2BYYg1l7YNN6JZQ0DnsEBuwE8afVz6OGEarZJBO5WVs5fG+d3nMgYYAv
   HVP9QjOvlyX7XIzkUUuh8qUMrIqzUzV0K+mFLsvwkTPb6dr+pUtWz20bV
   M6lrCG+6SdK1OEBPyUj3kpE5W9Yk6yoAAycJLkkvVBgP9NHhE6DhmO13z
   vSIcrjMGs1nKYzUxNTH4GNgdm/N4IwsEkETPKrwv2fewiZzfmgm8pEd6S
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="356873534"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="356873534"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 05:31:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="697285862"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="697285862"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Feb 2023 05:31:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPO3q-0003ZW-1F;
	Tue, 07 Feb 2023 13:31:02 +0000
Date: Tue, 07 Feb 2023 21:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+1080 bytes kernel size regression] [i386-tinyconfig]
 [895d773054] iov_iter: Add a function to extract a page list from an
 iterator
Message-ID: <63e2528e.Sie7U73em2h1kChi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +1080 bytes kernel size regression due to commit:

commit: 895d773054a2b9a9c4fffe251deaa3b78fefab92 (iov_iter: Add a function to extract a page list from an iterator)
https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-fixes


Details as below (size data is obtained by `nm --size-sort vmlinux`):

d0ffe02e: iov_iter: Define flags to qualify page extraction.
895d7730: iov_iter: Add a function to extract a page list from an iterator

+---------------------------------+----------+----------+-------+
|             symbol              | d0ffe02e | 895d7730 | delta |
+---------------------------------+----------+----------+-------+
| nm.T.iov_iter_extract_pages     | 0        | 1075     | 1075  |
| bzImage                         | 495904   | 496480   | 576   |
| nm.t.__iov_iter_get_pages_alloc | 735      | 950      | 215   |
| nm.t.first_iovec_segment        | 0        | 71       | 71    |
| nm.t.iter_xarray_populate_pages | 281      | 0        | -281  |
+---------------------------------+----------+----------+-------+



Thanks

