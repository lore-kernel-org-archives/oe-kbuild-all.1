Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAA47C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Nov 2022 03:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667444997; x=1698980997;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EuY4jhb0/CrdDuPuPDuR93j2aj1gWE9/NxAXw96gM90=;
  b=icp+NWX/E56/qWq7x/jEvqya2DlV2vBT2Y4lGPvT9Gaetra64lakxTdx
   qAQOhm59JZB9FdTZ0gPNPDkU+yONvrbQEg3rQ6bLkN7O+oBkI3aI0jNZt
   KuWW3ZykcFLro4Vuw12E+Spe69NxbBP5BWzqTahjurA+8psHxS8x2Sd7I
   k2K0OUH6q+p4ZxHTUc8vRNCkmpT0Mm3nhXXWpVK36+XSgrhCEWdBLsGQx
   6kU/PD/D7DJA0SiF4Mh1gLHlhhiCmYGgNC4q/ys3gLLAJ+UWBI+PJVRgx
   E3L1obnAteV9aL+BrgXm68e71A+imjBf0TY7n7B47Pb1yAMNft+EILFC5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="289964315"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="289964315"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 20:09:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="777139777"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="777139777"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2022 20:09:53 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqQc4-000FOr-1q;
	Thu, 03 Nov 2022 03:09:52 +0000
Date: Thu, 03 Nov 2022 11:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+1032 bytes kernel size regression] [i386-tinyconfig]
 [441db5fa36] iov_iter: Add a function to extract a page list from an
 iterator
Message-ID: <636330fc.92uvCcw0K2j9QLX+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +1032 bytes kernel size regression due to commit:

commit: 441db5fa36ac6eeb323178cea403677027ede94a (iov_iter: Add a function to extract a page list from an iterator)
https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-lib


Details as below (size data is obtained by `nm --size-sort vmlinux`):

4ddc0eba: mm: Move FOLL_* defs to mm_types.h
441db5fa: iov_iter: Add a function to extract a page list from an iterator

+------------------------------------------+----------+----------+-------+
|                  symbol                  | 4ddc0eba | 441db5fa | delta |
+------------------------------------------+----------+----------+-------+
| nm.T.iov_iter_extract_pages              | 0        | 955      | 955   |
| bzImage                                  | 491840   | 492384   | 544   |
| nm.t.__iov_iter_get_pages_alloc          | 720      | 936      | 216   |
| nm.t.first_iovec_segment                 | 0        | 71       | 71    |
| nm.t.iov_iter_extract_first_user_segment | 0        | 71       | 71    |
| nm.t.iter_xarray_populate_pages          | 281      | 0        | -281  |
+------------------------------------------+----------+----------+-------+



Thanks

