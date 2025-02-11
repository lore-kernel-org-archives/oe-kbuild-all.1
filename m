Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68476256C94
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 16:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291579; cv=none; b=Wgl3yGaeQDVMgUShZv025Do0Ovv/5cTDbdPb1vGhlvJZmbuwKYEPNbrQYWLhEpQGDk71s1C4H5H1TVbHlBKZhYEr8XoxBEqZC3VQNiqGI3QpgHMvTKtUlerDCMN3CkvQ8XA0+9C/VVPfP9OnamfnY8U7/6O70BHpZgv28lUmJzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291579; c=relaxed/simple;
	bh=e85HWHgoBQOm4j1abf5gLl/lX/2Ykg2xZnhWLvM8Vdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsOkf1Z2wjLa2ULkrxqm5j8QJVprr1F95fuSszuqB8cynYzDxKCxUUURL8eamgHKI+2zCBOBFUyViZFSve8rERRcGidHyZzT8j4m13Q7220lmdVDPMCv3TCQxw8jU/R+wQzHUIst/0F8ZNM6mdgrIp2t2CIVe8rTVZTIQjIh9KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbI+PusE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbI+PusE"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f0444b478so82488815ad.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 08:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739291578; x=1739896378; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A5/z+2AkX14OVBfSBzvANjsGUw8qqOk+bTDpMOl03dA=;
        b=LbI+PusE7GgwL4BvcMZ0WYpwd5daC4zbxgkub7ocmr27uKpqMjOPEZ+PzY+qOn98ha
         cS34EUycHZHW2AmdXOqpJwLJigehBLqVtwuaN6bjjrHbOSRljEeTjczIcmDLRHDzPUFD
         gR9VQVTjElEfeTF+q4rzaZgEJ3X/5ug4vIjeZR8H1IeKXLYxsJGCi0fHkuKshp+lrNAR
         2W6ZcsnxThqzBSlJ5ge1z383B/jO/h31nwNz/SQ6hu2MbqVsk0p/FKTIcFo2XPoZtCCL
         iYuoj1F13bnU18rFyqbQGzJjlfvIDRGpSF6mR8EN4Zs4hm9DL6tRMoq+RF6eOXnxGYi5
         mSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291578; x=1739896378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5/z+2AkX14OVBfSBzvANjsGUw8qqOk+bTDpMOl03dA=;
        b=p94hKPtuwAE9agWX2t9MnyO4+hKU3gQc1qfBqkeCyQgKtvL49TG8TIwv3HI5V4VqmC
         xpv9qt5QbHlPEJwHrwieg8xTEey8+F8OdfnAIprC5TdIk8AKpT1h94MMqHitmwll7/zG
         tux01f48JgIRfzYs6rxjjy8mmeqTNVDrdj2o5k9g9ryfPYETSXKXk44nMTpnONW1skns
         WQBoK2QVICGOBjkPDDguhpyTElt4UEJOmKGqwayfJHJ5IJA+3l+PyVEs4oteMaaj1Lay
         6XmBLSHXcuocoINwz2aGqt16PQFqhZNINqsc3OUARL3khLjcWmBIHLCXusqDiqns9yIb
         BL7g==
X-Forwarded-Encrypted: i=1; AJvYcCXFIUAVGjFsJEDJtc/iapHjXZ+tw5hgqqHiJF3UfUADCZTYxQO6aL5IR/C26WYDe1Q2bHoFk8FW8mTJLnGA@lists.linux.dev
X-Gm-Message-State: AOJu0Yw02e0z6hQwF3VDIXcOJgjmEjLwB+PWcu5RmBmG5fIhY8TQDLRA
	+N+340c19F9/ASQlPrYZ84qWuTJAI/DzpjfoT0erXXaw1u+oC9s=
X-Gm-Gg: ASbGncsl2Zx5JCwdU403aqxb9RQZGzgGIGg2m0+oX1DqVlsE8RZno0ki5PsnaV1uPs8
	RA8m1eFPl2yma3JW9d/CjjEPYBQJZNdglzUk3UiFBiNzwkUvPymsJDBQ9SzYY4XvT6DDfV9cGAx
	qtSw4dPfi2y2GGtF2P/Y9tDD/h0liqsdBpHk5n7HblP8VBcSlH6p26afpBXXr8MZOZ6ii84zNPU
	WxLe6c8WTIqhl+fIym9tTiRrXrZVTlG3Gmj/I7SxNT0WGbl6YxDeBU6ogtsXfcJEIl1KXEIx24R
	Oc1A8XB3UNNbZy4=
X-Google-Smtp-Source: AGHT+IFat0G7HhNeYeKUsWDr3KgwrFNW75mw6kVWT17FjiObx98gq2CIoJqz/DfNT9Aw37wUcqQYYw==
X-Received: by 2002:a05:6a21:b8b:b0:1d9:3957:8a14 with SMTP id adf61e73a8af0-1ee03a21cfemr31578020637.1.1739291576165;
        Tue, 11 Feb 2025 08:32:56 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73048a9d7aesm9591487b3a.33.2025.02.11.08.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:32:55 -0800 (PST)
Date: Tue, 11 Feb 2025 08:32:54 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	Saeed Mahameed <saeed@kernel.org>
Subject: Re: [PATCH net-next 04/11] net: hold netdev instance lock during
 rtnetlink operations
Message-ID: <Z6t7tlSr8W9SznXO@mini-arch>
References: <20250210192043.439074-5-sdf@fomichev.me>
 <202502112254.DdkYlmMx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202502112254.DdkYlmMx-lkp@intel.com>

On 02/11, kernel test robot wrote:
> Hi Stanislav,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/net-hold-netdev-instance-lock-during-ndo_open-ndo_stop/20250211-032336
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20250210192043.439074-5-sdf%40fomichev.me
> patch subject: [PATCH net-next 04/11] net: hold netdev instance lock during rtnetlink operations
> config: arc-randconfig-001-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112254.DdkYlmMx-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112254.DdkYlmMx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502112254.DdkYlmMx-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    net/core/dev.c: In function 'dev_set_mtu':
>    net/core/dev.c:9320:15: error: implicit declaration of function 'netdev_set_mtu_ext_locked'; did you mean 'netdev_ops_assert_locked'? [-Werror=implicit-function-declaration]
>     9320 |         err = netdev_set_mtu_ext_locked(dev, new_mtu, &extack);
>          |               ^~~~~~~~~~~~~~~~~~~~~~~~~
>          |               netdev_ops_assert_locked
>    net/core/dev.c: At top level:

Looks like my rebase error, will fix it in v2. Should hopefully not
affect the review overall..
