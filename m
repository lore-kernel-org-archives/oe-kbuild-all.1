Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD35FED3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jan 2023 02:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673058809; x=1704594809;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ItwsI/AAPMWTJqfgJ/mzoFnkmasLg7eWpouT12L4I5c=;
  b=FOZppnCLba1ib3VWd685EoVqC+0TNxnsPKjLSAirbDzsgc1rjyXHiJ26
   VsaUUSDgOK3WZwmhBkZWyfINBGHCbRTW829kXn42NVdAX8BsG70nFevi1
   otySkb9FwaIUemkp75V54wCH0TW1dUAUPqAglQOxvGHDaS5iKelchRw0W
   lR2RJ3YuHRf1W6MBp1Wvxb4lUxDhHdJThAlmAec4dONnbc8i0x8St9fSx
   /JqnFgxPmZfmfPRe1xmvfKqzgxjx/fy6e35ZEe8+6l1iqj/rTMIb3ndew
   MbYqvzQNyJBych25DxtnGt034kZYf27idocJbuFYKItE4eeGAXzV1lLbe
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="320309136"
X-IronPort-AV: E=Sophos;i="5.96,307,1665471600"; 
   d="scan'208";a="320309136"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 18:33:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="744816075"
X-IronPort-AV: E=Sophos;i="5.96,307,1665471600"; 
   d="scan'208";a="744816075"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Jan 2023 18:33:28 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDz1T-0004AG-10;
	Sat, 07 Jan 2023 02:33:27 +0000
Date: Sat, 07 Jan 2023 10:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+1152 bytes kernel size regression] [i386-tinyconfig]
 [c645cfc4b7] iov_iter: Add a function to extract a page list from an
 iterator
Message-ID: <63b8d9c1.gFtWgplRZ8BaM/Z6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +1152 bytes kernel size regression due to commit:

commit: c645cfc4b715b7828a1a29c317b207dac89ca70e (iov_iter: Add a function to extract a page list from an iterator)
https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-extract


Details as below (size data is obtained by `nm --size-sort vmlinux`):

af711260: iov_iter: Use IOCB/IOMAP_WRITE if available rather than iterator direction
c645cfc4: iov_iter: Add a function to extract a page list from an iterator

+------------------------------------------+----------+----------+-------+
|                  symbol                  | af711260 | c645cfc4 | delta |
+------------------------------------------+----------+----------+-------+
| nm.T.iov_iter_extract_pages              | 0        | 1083     | 1083  |
| bzImage                                  | 495840   | 496448   | 608   |
| nm.t.__iov_iter_get_pages_alloc          | 721      | 929      | 208   |
| nm.t.first_iovec_segment                 | 0        | 71       | 71    |
| nm.t.iov_iter_extract_first_user_segment | 0        | 71       | 71    |
| nm.t.iter_xarray_populate_pages          | 281      | 0        | -281  |
+------------------------------------------+----------+----------+-------+



Thanks

