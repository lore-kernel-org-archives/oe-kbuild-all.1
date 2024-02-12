Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2E33A8EB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707743874; cv=none; b=tnVmFFN97XqYTYgMCLQilW5B7LokF3VBD/xUYtj/4egDYxRt4V9Vv4xzADdMKPq6XbJUk7ITxsSC8TB8oXspkMc0IdOlieF12xEA6T/j5pB8H78O0RM3Tu+N7hqyIXBqwMUrFm2y4b7qSC9KhBE/PIJxZ0N5cT/MpvbjtT6yvOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707743874; c=relaxed/simple;
	bh=q4qP82FOXPBJyfTKqkI7kEs7ZoU8FcrMrDnPTekYs18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pouNnpFk4R5cERCOn95EmNVXOHIBLM8tQKF44HImjxDFuhFUXm5CO7k3BYJo6q9nvly40wlhLh5zaLskNNtv4JAdhZ0F/HatwSSfz7hn3BUqdncx8CtYH0IJ92SBexu8YITI6o56KU1CSsY/VYkCMK5myHirQ5qikHouyjMaiU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dXMxg4GE; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dXMxg4GE"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d932f6ccfaso21026545ad.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 05:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1707743872; x=1708348672; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qm/YqX9uEOdb2kQB3M409FAVZ5tf5xIwSXUTJ0MefI4=;
        b=dXMxg4GEBu98PlmyiUdus/7ffOiXI28cNQCE/ZeIHT+6yyL36T6y2ETXih728ylziM
         Hl+FSif/d1uvEx7qZGTQRXwRGoX77J21Mi/OzGGJxsdFxvS9SRyXEk8jtouPi48Db/s/
         FwI5WBk9CFvSn/qy0qoRynmAqJ3ZzoKg3gmn/9i9yT4Gvqs5dccrEOOHaNM3uc1O5PEB
         8cUMPluuTHX7+0y5mAkh5uMkrW/57TW/43VVx96+k9w40KXLrg8x1g4JfXiu8Z0h2BaH
         iCkScEn2jocsz8u4P8U+et33/GqnqFKTgM6qpYf3TyD1fFXd6hwtUxFtsQrAtrl0nQMt
         VkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743872; x=1708348672;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qm/YqX9uEOdb2kQB3M409FAVZ5tf5xIwSXUTJ0MefI4=;
        b=J37KzVQqa3lSqmTuVmkRrw8H6dPdC/WHKzH19i1gSZWzsC/rEUXwen8lyz7Qee5+1t
         jiqxn9QocXrtpgOVwlAMDFjTskhQDU5e20zynh19+k2rRd851JbaFsqbeojyWqqA5bSH
         EHSY5YT26MFLyA8eZE0t/MDkjq+dsWl/r7T9hmrj5bZ/a9a+usPJlJhz+fEcH78xoHPW
         4/gLe/bW8HIsvJLuExYCe+N/PWZSJ5QsnbL/25lMgn53tJ2GajNM8GW7xSawKEassCx3
         0tyPmtMF9/OhniEO8/A7VUpY3TWXr0dXF/Qvy/K3+5W102PwOTVsSwUqXtEN0TdaFEWG
         PEPw==
X-Gm-Message-State: AOJu0YzgEqK0pxbJQ+DMRMEspyL+PMQ/d+t9LpVdMBvQk/oLu3fJm/av
	2F0P0CZHbaabC+OZ084qp7DpQ1JoLtEZ/Zh4Wra2c8X+o/UFDUFdSZhW2tZoLFk=
X-Google-Smtp-Source: AGHT+IG4i2F8jes8SWyhPU9KzSPg92BHLobuOB60eNJ5XoqdtqSJy2pk8QJ2bS+RXJDsRCu4HUKbeg==
X-Received: by 2002:a17:902:d2d2:b0:1d8:f071:5067 with SMTP id n18-20020a170902d2d200b001d8f0715067mr7055492plc.35.1707743872372;
        Mon, 12 Feb 2024 05:17:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWx1ihhn9KToX8YItEUX78cWAXU6fzVhUpXmF9/mp/4ogkpwNeWJ0edTGMaQ49NRdbv/u7fJmam54FIUEF9MaKPo0HZj174f2iFwvoAHTiUKQmu28RQEVHt06PGaAFhYYss1cA9fhM7z/VCyOEn38AZyQwQaChYyr2ECUm0zjU5c6c2fwdKlI6kWMH0OEfCqszPbQA/1tLAqJ7YWhiuLLWM7HKOJT6GlS5dmU5qxU84KLM7w0ZzMfwChA==
Received: from [10.255.183.165] ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902c74d00b001d963d963aasm323858plq.308.2024.02.12.05.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 05:17:51 -0800 (PST)
Message-ID: <f4143532-ece4-413a-ab59-45f91cfe66d9@bytedance.com>
Date: Mon, 12 Feb 2024 21:17:45 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/zswap: global lru and shrinker shared by all
 zswap_pools
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosryahmed@google.com>,
 Nhat Pham <nphamcs@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-kernel@vger.kernel.org
References: <20240210-zswap-global-lru-v1-1-853473d7b0da@bytedance.com>
 <202402120226.TK7G37U9-lkp@intel.com>
From: Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <202402120226.TK7G37U9-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/2/12 03:01, kernel test robot wrote:
> Hi Chengming,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 191d97734e41a5c9f90a2f6636fdd335ae1d435d]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Chengming-Zhou/mm-zswap-global-lru-and-shrinker-shared-by-all-zswap_pools/20240211-220028
> base:   191d97734e41a5c9f90a2f6636fdd335ae1d435d
> patch link:    https://lore.kernel.org/r/20240210-zswap-global-lru-v1-1-853473d7b0da%40bytedance.com
> patch subject: [PATCH 1/2] mm/zswap: global lru and shrinker shared by all zswap_pools
> config: x86_64-randconfig-013-20240211 (https://download.01.org/0day-ci/archive/20240212/202402120226.TK7G37U9-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402120226.TK7G37U9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402120226.TK7G37U9-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mm/zswap.c: In function 'zswap_shrinker_count':
>>> mm/zswap.c:1300:42: error: 'pool' undeclared (first use in this function); did you mean 'zpool'?
>     1300 |         nr_backing = get_zswap_pool_size(pool) >> PAGE_SHIFT;

Forgot to test with !CONFIG_MEMCG_KMEM, need to change to zswap_pool_total_size here.

Thanks.
