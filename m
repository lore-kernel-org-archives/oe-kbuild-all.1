Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEFA1D7E26
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740912204; cv=none; b=Fn46tPjMDo81mYhzzVvZF39kkcfVynZFETWRA2N069obMMrvScJm5FtlXbtHT49WjEeFfkf+vOcWf3ePvKR1HGiDDPymFPyOGEwI6HLhfDyPT09sK950jSGA77l6YCNCmCz0NTZwMazZnS7/swvBDi0wabdQVxlAzn583Nun2vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740912204; c=relaxed/simple;
	bh=SMf/useHHf1YMvHuunXb88SljOIu1qy0owYLKdn1GPA=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZczYyWfn7bA6WHYyJV9zFFgZukvo7LoTWhGYWl/moDvgVRnaWI6k38gN0mXOBNv+qONJaBjTm44RJdMh4CFaACyPa/ve9EoZhhQDPdCR+Lsl9PvNhsGxVnZUG32Bn8SR+mBz8oyqBqmQab3t0fZbcifnw5dSYS4Kb0IANXA1dt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=mz6Nbgec; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="mz6Nbgec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T4q9NpZeM/ZlPGNhbv28c1M44w3nObBptqjTGFpYdu4=;
  b=mz6Nbgecxg9eTwXzfNEcQcbPWbNguWJpb06WvEINpfNWY1Ic349jzcRv
   K1xwAkFlCgQVwyyCXqJ8RJAwFZVIesXNcYWRVRmghELbeEXzvDdjITAnG
   xb+rjKzmnOlLWZtLHzcYr+qkaE/AXPzFEA3j6HfHkQ6DBgk0oo/p897Ms
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.13,327,1732575600"; 
   d="scan'208";a="210730154"
Received: from unknown (HELO hadrien) ([50.225.219.62])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 11:42:09 +0100
Date: Sun, 2 Mar 2025 05:42:08 -0500 (EST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Robert Budai <robert.budai@analog.com>
cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Ramona Gradinariu <ramona.gradinariu@analog.com>, 
    Antoniu Miclaus <antoniu.miclaus@analog.com>, 
    =?ISO-8859-15?Q?Nuno_S=E1?= <nuno.sa@analog.com>, 
    oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:testing 131/172] drivers/iio/imu/adis16550.c:1029:22-52:
 duplicated argument to & or | (fwd)
Message-ID: <597fff55-e92b-8dc-d75-384b3b9a903f@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1515898418-1740912130=:3240"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1515898418-1740912130=:3240
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

ADIS16550_STATUS_CRC_CODE is used twice

---------- Forwarded message ----------
Date: Sun, 2 Mar 2025 15:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jic23-iio:testing 131/172] drivers/iio/imu/adis16550.c:1029:22-52:
    duplicated argument to & or |

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Robert Budai <robert.budai@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Ramona Gradinariu <ramona.gradinariu@analog.com>
CC: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: "Nuno Sá" <nuno.sa@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   bd9ffb54e566ad6f94ec4293f82f06d417b6cfc8
commit: 55be950cfc6031263d6dd3d6518a5a934ae414cd [131/172] iio: imu: adis16550: add adis16550 support
:::::: branch date: 28 hours ago
:::::: commit date: 8 days ago
config: m68k-randconfig-r064-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021535.37zbQXIZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503021535.37zbQXIZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/imu/adis16550.c:1029:22-52: duplicated argument to & or |

vim +1029 drivers/iio/imu/adis16550.c

55be950cfc6031 Robert Budai 2025-02-17  1018
55be950cfc6031 Robert Budai 2025-02-17  1019  static const struct adis_data adis16550_data = {
55be950cfc6031 Robert Budai 2025-02-17  1020  	.diag_stat_reg = ADIS16550_REG_STATUS,
55be950cfc6031 Robert Budai 2025-02-17  1021  	.diag_stat_size = 4,
55be950cfc6031 Robert Budai 2025-02-17  1022  	.prod_id_reg = ADIS16550_REG_PROD_ID,
55be950cfc6031 Robert Budai 2025-02-17  1023  	.prod_id = 16550,
55be950cfc6031 Robert Budai 2025-02-17  1024  	.self_test_mask = BIT(1),
55be950cfc6031 Robert Budai 2025-02-17  1025  	.self_test_reg = ADIS16550_REG_COMMAND,
55be950cfc6031 Robert Budai 2025-02-17  1026  	.cs_change_delay = 5,
55be950cfc6031 Robert Budai 2025-02-17  1027  	.unmasked_drdy = true,
55be950cfc6031 Robert Budai 2025-02-17  1028  	.status_error_msgs = adis16550_status_error_msgs,
55be950cfc6031 Robert Budai 2025-02-17 @1029  	.status_error_mask = BIT(ADIS16550_STATUS_CRC_CODE) |
55be950cfc6031 Robert Budai 2025-02-17  1030  			BIT(ADIS16550_STATUS_CRC_CONFIG) |
55be950cfc6031 Robert Budai 2025-02-17  1031  			BIT(ADIS16550_STATUS_FLASH_UPDATE) |
55be950cfc6031 Robert Budai 2025-02-17  1032  			BIT(ADIS16550_STATUS_INERIAL) |
55be950cfc6031 Robert Budai 2025-02-17  1033  			BIT(ADIS16550_STATUS_SENSOR) |
55be950cfc6031 Robert Budai 2025-02-17  1034  			BIT(ADIS16550_STATUS_TEMPERATURE) |
55be950cfc6031 Robert Budai 2025-02-17  1035  			BIT(ADIS16550_STATUS_SPI) |
55be950cfc6031 Robert Budai 2025-02-17  1036  			BIT(ADIS16550_STATUS_PROCESSING) |
55be950cfc6031 Robert Budai 2025-02-17  1037  			BIT(ADIS16550_STATUS_POWER) |
55be950cfc6031 Robert Budai 2025-02-17  1038  			BIT(ADIS16550_STATUS_BOOT) |
55be950cfc6031 Robert Budai 2025-02-17  1039  			BIT(ADIS16550_STATUS_WATCHDOG) |
55be950cfc6031 Robert Budai 2025-02-17  1040  			BIT(ADIS16550_STATUS_REGULATOR) |
55be950cfc6031 Robert Budai 2025-02-17  1041  			BIT(ADIS16550_STATUS_SENSOR_SUPPLY) |
55be950cfc6031 Robert Budai 2025-02-17  1042  			BIT(ADIS16550_STATUS_CPU_SUPPLY) |
55be950cfc6031 Robert Budai 2025-02-17  1043  			BIT(ADIS16550_STATUS_5V_SUPPLY) |
55be950cfc6031 Robert Budai 2025-02-17  1044  			BIT(ADIS16550_STATUS_CRC_CODE),
55be950cfc6031 Robert Budai 2025-02-17  1045  	.timeouts = &adis16550_timeouts,
55be950cfc6031 Robert Budai 2025-02-17  1046  };
55be950cfc6031 Robert Budai 2025-02-17  1047

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
--8323329-1515898418-1740912130=:3240--
