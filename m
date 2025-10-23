Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE220285041
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 06:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761201406; cv=none; b=UPnsR1z52f0C1WLbeZuJmAFn0jtgxmFv1q2jg+q/wAo4yYXq5I8PMoktkFzMNuM+4EnY7FqaolowNMnu6DSp+RKy9i0kqm59SFJiIpesPZAb/6kOLNZ4wN+prWAQYGg2ssQljfekxW/wgANpTmzXGqhPKk5Akp1W8TUjXLrzXyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761201406; c=relaxed/simple;
	bh=jHktJRpimehEbEWEHzUs0oQlFXrvPr4/EwzgpKc+WTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpbXm8f6nmcMvuiLdBSEhu+U1uLE6b9m+9pHxvqtFQatouOAb9owAogvWPbzqLPK0wS9IjipHyuF0hyR4uYhoSW3NsZRwNRow3Us59EkN1VdLuQEQa4VKyrBS2ljl2jJ0zAdi07XCd4LlhNNO6sDT/f7tjbt7rLK+5YqcJqm8YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/R8pJ1i; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/R8pJ1i"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-78125ed4052so598169b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 23:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761201404; x=1761806204; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vxh5IXXN/oTEexZMfsEWqTqOVeT3OfvGPgG6VwjolG4=;
        b=A/R8pJ1iGd4+M1AiqsPE6DBTLYeF1eGMuQwiTbL91KmDSFBfXZLb0QOZDCzpRJEiCX
         t99GTxKN2fCXFvpNfcxLmGjfROxXIayLHjNjFrTom/F7U6edzOMnTLV2p/7k4HSkqtU/
         I4FlZJtA4jZBY/NZuhMxr/vOvLuVBhBkDz+3IlwDdeWQINn3P3gnrf6GInxg25utavxo
         aqm28WE9yqQiGd7a+t2Ftp5k63oLCxvaHpdkKWwjBX/hqQtSAGJvt2600pXeNTqqgcbA
         zbwVLY/6vt5x+eMZGL3IU5iNXTm0iRcet8NdeQi1P3aPbD2m8RH5KTcvAcXfBR+vcUJb
         QdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761201404; x=1761806204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vxh5IXXN/oTEexZMfsEWqTqOVeT3OfvGPgG6VwjolG4=;
        b=tt6+7rtzq0QJ+1DJ4e/JHfVNzfL5FcEErg90RuKMMU5/ADCaeJdlTJilW26Bcc6laV
         c6OXXDYiA/mVpf8S8MLur4CqN1uOkav/SNH8YZOoItslgYnSLMUWngLtEnsR23XAw9Kw
         MGoHOd2yetWbckQF/ZtW9W+Ql+O3OS2jV3iQ2mNGixxhcaVCafMHPd/qkWLXlwmF7gRj
         eN/COS361geT8hU+Z4QG7qv5XWPL7NMUB5oqXYBoDA/O6fsKT5yaODroQ5m9Wsi6dKZj
         I13SPcoPZyRuxeu7TN1wonRLlKK5FNbpaafqjdwk9NIODR0Ug7RpqZRGVEMfTC7QlSFy
         TclQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC1Aver4wxt93j4fb16iOxRhHLv4JzUaGJxRIIh8r7+OZOs3iTOqKAHdmkm2Hi7B4XscdZsBweD7rcXbq6@lists.linux.dev
X-Gm-Message-State: AOJu0YwuVgrCGr8aD7eXUfUDIS2jIsrrBTgEKFbVlf/D9819sX3cpKm7
	x9py4XgcfkvU6f9Suu4sBzC7CbGJGBqXsQsjHLh/HhPwbAzvX9H38ljyUD/TZivm0bQUdHp6bH/
	5ww+0
X-Gm-Gg: ASbGncuufmwWLllzIepgSMNgc0kRdKnb6Grl3jlNVy3YaNHpPedFf7pgtb7ib26jhCR
	FMRIwV2gZaisejEWJjgcu1C0hWLKBTqvMMy32L2lQ4xeR8uZTzy/H8zZfc+9SkOP8GoibaA2zIG
	a3zEJ8J2ug+/WZjEIKhr3xtyRYKnTmP8WNhH+aI1KxAQfuC1izKq/62O6OGyMVNB9ImQV6E028v
	HN9fE+dejY4v/3SGfuMqnwZ2evIIjmyiyzcouVy3t8fgoW9rGRZW8CTMuSx+ck1EFCsjzyw3y8S
	dmqYtFdZlbYcHRU8bHtZPYUTl22nvrqFOqdRVeCXgNEkFJvfBZ7BlzUZxhXFk2a6OF8kpsmoXt3
	J6Hl6YUmJiIQN5fJaJ4lUfsLu8O8FqJD8UatKejg5MnCHJFfRs0nnvM+f4M6Nw7ujE7gNC0Liyy
	Y4Hw==
X-Google-Smtp-Source: AGHT+IFJgbOUm4zaDdsgXZjpxpGCcpFXaWdFjqgKNOX33nOXyIbf12R2eSDruOtha6dRePJInBpPcA==
X-Received: by 2002:a05:6a00:9514:b0:781:2271:50df with SMTP id d2e1a72fcca58-7a220ad9c9cmr28464862b3a.19.1761201401027;
        Wed, 22 Oct 2025 23:36:41 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274b8a0edsm1356826b3a.35.2025.10.22.23.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 23:36:40 -0700 (PDT)
Date: Thu, 23 Oct 2025 12:06:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [vireshk-pm:opp/linux-next 2/2] drivers/opp/of.c:1545:3: error:
 cannot jump from this goto statement to its label
Message-ID: <ocd5xl3svsyqivfl76yoxzbwakgx6zpdujxvr37xcr63lhaqgg@3yyspadowr3j>
References: <202510230410.vPtSOkAh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510230410.vPtSOkAh-lkp@intel.com>

On 23-10-25, 04:34, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next
> head:   45a64ff434a027c296d1d5c35f442e51378c9425
> commit: 45a64ff434a027c296d1d5c35f442e51378c9425 [2/2] OPP: Initialize scope-based pointers inline
> config: arm-randconfig-004-20251022 (https://download.01.org/0day-ci/archive/20251023/202510230410.vPtSOkAh-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230410.vPtSOkAh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510230410.vPtSOkAh-lkp@intel.com/

Fixed and pushed.

-- 
viresh
