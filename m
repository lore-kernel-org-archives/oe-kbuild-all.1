Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62E763A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 19:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NlqCAgX2FqmRJsHcwH73Bcmsbvjn1SQAvRkpJghp6wc=;
  b=KA1xVz1RbZpifC1DPsYqAvpTjIKKmITnAsGvZVg9hfMkeHfcp5wjtVdv
   1wOnDxzAEBJIuzDRRlUIvRuadSx4yL9n0MMSyqfOWjBquobEe5H9kqqk3
   eEImOu6Kr6k7PWacsjh/HXWEpgFR7bNUDMTUUlecd9QK0OZGToQdG4vFN
   w=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,175,1694728800"; 
   d="scan'208";a="127842136"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 21:08:19 +0200
Date: Mon, 25 Sep 2023 21:08:19 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Guenter Roeck <groeck@google.com>
cc: cros-kernel-buildreports@googlegroups.com, oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 32/34] drivers/iio/industrialio-core.c:1851:2-8:
 preceding lock on line 1848 (fwd)
Message-ID: <alpine.DEB.2.22.394.2309252107030.3165@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-417812380-1695668899=:3165"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-417812380-1695668899=:3165
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

Is it intended to hold the lock when successfully exiting the function?
If so, perhaps that information could be added to the predecing comment.

julia

---------- Forwarded message ----------
Date: Tue, 26 Sep 2023 02:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-5.4 32/34]
    drivers/iio/industrialio-core.c:1851:2-8: preceding lock on line 1848

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   47a5bab6041a6e6381156a2dfe5781ded89ffa63
commit: 16382e4ab8163f25b527ef0982887c66a9042a42 [32/34] BACKPORT: iio: core: introduce iio_device_{claim|release}_buffer_mode() APIs
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-101-20230925 (https://download.01.org/0day-ci/archive/20230926/202309260246.FFJPzbf1-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230926/202309260246.FFJPzbf1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202309260246.FFJPzbf1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/industrialio-core.c:1851:2-8: preceding lock on line 1848

vim +1851 drivers/iio/industrialio-core.c

08a33805518e784 Alison Schofield 2016-03-09  1834
16382e4ab8163f2 Nuno Sá          2022-10-12  1835  /**
16382e4ab8163f2 Nuno Sá          2022-10-12  1836   * iio_device_claim_buffer_mode - Keep device in buffer mode
16382e4ab8163f2 Nuno Sá          2022-10-12  1837   * @indio_dev:	the iio_dev associated with the device
16382e4ab8163f2 Nuno Sá          2022-10-12  1838   *
16382e4ab8163f2 Nuno Sá          2022-10-12  1839   * If the device is in buffer mode it is guaranteed to stay
16382e4ab8163f2 Nuno Sá          2022-10-12  1840   * that way until iio_device_release_buffer_mode() is called.
16382e4ab8163f2 Nuno Sá          2022-10-12  1841   *
16382e4ab8163f2 Nuno Sá          2022-10-12  1842   * Use with iio_device_release_buffer_mode().
16382e4ab8163f2 Nuno Sá          2022-10-12  1843   *
16382e4ab8163f2 Nuno Sá          2022-10-12  1844   * Returns: 0 on success, -EBUSY on failure.
16382e4ab8163f2 Nuno Sá          2022-10-12  1845   */
16382e4ab8163f2 Nuno Sá          2022-10-12  1846  int iio_device_claim_buffer_mode(struct iio_dev *indio_dev)
16382e4ab8163f2 Nuno Sá          2022-10-12  1847  {
16382e4ab8163f2 Nuno Sá          2022-10-12 @1848  	mutex_lock(&indio_dev->mlock);
16382e4ab8163f2 Nuno Sá          2022-10-12  1849
16382e4ab8163f2 Nuno Sá          2022-10-12  1850  	if (iio_buffer_enabled(indio_dev))
16382e4ab8163f2 Nuno Sá          2022-10-12 @1851  		return 0;
16382e4ab8163f2 Nuno Sá          2022-10-12  1852
16382e4ab8163f2 Nuno Sá          2022-10-12  1853  	mutex_unlock(&indio_dev->mlock);
16382e4ab8163f2 Nuno Sá          2022-10-12  1854  	return -EBUSY;
16382e4ab8163f2 Nuno Sá          2022-10-12  1855  }
16382e4ab8163f2 Nuno Sá          2022-10-12  1856  EXPORT_SYMBOL_GPL(iio_device_claim_buffer_mode);
16382e4ab8163f2 Nuno Sá          2022-10-12  1857

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
--8323329-417812380-1695668899=:3165--
