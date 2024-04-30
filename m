Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3DC161
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 00:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714436568; cv=none; b=iahyjIwRZsHnGDMMDs/wDjq8Q/HFFrwbb4UkJLLjH5xr7SxWRjlUnKWBDAMEhFDxRY5rzxp0hSs8Ez1ORxBLMbOYHoSbOFk4QTQgxpsUPKzF1K0KZo/Rq28f+s1rF5vZhtHAL3NEWtveUmVwJBHxliIaoJk6K3nkkm3U4D84xls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714436568; c=relaxed/simple;
	bh=Xvbaj/DJO2mdOJWsGzBTH9vTyOJw4Wm6i9BU4C//60U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rlpk6H8E/7KsJTI0N4r7AT+9ScmR5SxEchhycpa8JeegerERFuiKtP8ZdCDFIqp/+pudiQKpn4hYhdut7+pwNn8kclE0PmyYWCOguWuKKiqqrKg+eaaf1VxrMuN2is0S1MLLpOjlj39UAV+tEWNcM+3k1PvSilplxUEv2s13VsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4lOqMm1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4lOqMm1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714436567; x=1745972567;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Xvbaj/DJO2mdOJWsGzBTH9vTyOJw4Wm6i9BU4C//60U=;
  b=P4lOqMm1LIlG/BsQk4ttaVkMmsmlHxQ2iKNHLoqqGjPdA68azaF6+TC6
   48X2bFR99dAkQN8vU79hEQ1FT0hlFTTKQHzvky+jAWLmh4wVWzeVFisml
   C3mqnlAg2crLJj9ISJZMQA7dqj0BfreOZT1d2grQ16+LsHR4YVzZssdpv
   Uc+O5rG9I1aQ7hXdZrsY2Dk6fRR/6LkRNfkHzpQGKG7/CQZatMyK+gWax
   mgn8OsLbl8HN8R9BzdBoqs1npDbJMpzq6gbFx5bInqklciqOLLGB213xL
   PUaPVxV3pylAUZDKcgMZ3qOA/tW6pvDdzMK9hMOMDMJ87GMrCLJGbyiZv
   Q==;
X-CSE-ConnectionGUID: WJtw0JwJQOK9f4rDU/Zbuw==
X-CSE-MsgGUID: Rsqh1vM6SqCSsYbzPwhTJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10244947"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10244947"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:22:47 -0700
X-CSE-ConnectionGUID: 08JP9uzbQqW3X1WoVpY3gg==
X-CSE-MsgGUID: rpiHiZ6QTXqECZXCd7n5Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="30970957"
Received: from biswabhx-mobl1.amr.corp.intel.com (HELO [10.212.18.127]) ([10.212.18.127])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:22:47 -0700
Message-ID: <ae682602-1a41-4992-908c-314126628359@linux.intel.com>
Date: Mon, 29 Apr 2024 19:22:45 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [plbossart-sound:sdw/parse-functions 9/12]
 sound/soc/sdca/sdca_functions.c:44:11: error: call to undeclared function
 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function
 declarations
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202404190735.7vG3UCfH-lkp@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <202404190735.7vG3UCfH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>    In file included from sound/soc/sdca/sdca_functions.c:12:
>    include/sound/sdca.h:33:1: error: expected identifier or '('
>       33 | {
>          | ^
>    sound/soc/sdca/sdca_functions.c:14:5: error: redefinition of 'sdca_alloc'
>       14 | int sdca_alloc(void **context,
>          |     ^
>    include/sound/sdca.h:25:19: note: previous definition is here
>       25 | static inline int sdca_alloc(void **context,
>          |                   ^
>>> sound/soc/sdca/sdca_functions.c:44:11: error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       44 |         status = acpi_evaluate_integer(adev->handle,
>          |                  ^
>    sound/soc/sdca/sdca_functions.c:44:11: note: did you mean 'acpi_evaluate_object'?
>    include/acpi/acpixf.h:550:8: note: 'acpi_evaluate_object' declared here
>      550 |                             acpi_evaluate_object(acpi_handle object,
>          |                             ^
>    include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
>       93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
>          |                            ^
>>> sound/soc/sdca/sdca_functions.c:44:37: error: incomplete definition of type 'struct acpi_device'
>       44 |         status = acpi_evaluate_integer(adev->handle,
>          |                                        ~~~~^
>    include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
>      795 | struct acpi_device;
>          |        ^
>>> sound/soc/sdca/sdca_functions.c:110:9: error: call to undeclared function 'acpi_dev_for_each_child'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      110 |         return acpi_dev_for_each_child(adev, find_sdca_function, sdca);
>          |                ^
>    sound/soc/sdca/sdca_functions.c:110:9: note: did you mean 'device_for_each_child'?
>    include/linux/device.h:1060:5: note: 'device_for_each_child' declared here
>     1060 | int device_for_each_child(struct device *dev, void *data,
>          |     ^
>    5 warnings and 5 errors generated.

Fixed with depends on ACPI, thanks!
