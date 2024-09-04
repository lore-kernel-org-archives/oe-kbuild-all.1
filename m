Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378D21E410B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 19:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725477131; cv=none; b=VQ7J2NEzVSSMgNfwnIAC6yPoMapaceF67Ru7tVAiS0yjFTJHB1XfXOFqBILWZ9Gnopt9kM3CJMJkPb+4/eyfTCu1U/7vkbVAjmLm48bTv7usrv1aGxRN8sq8AEdAIyej50Y0d8dN0XBqDITmAsde4ywHJDPr8t5rZ7nzzw54k54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725477131; c=relaxed/simple;
	bh=ruLjwy2jFV+ghDFSNtgYsZSJsAG96sW8A464lo1E1rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKa+2k5flifFlrdkODMMDV/rFwP0KwMyVBRZjXUarm0vYqaqm+rHHbzz3LTuuhW0QH1yQV1hPt/DYDIVGUfXWfRqw//44jOJdWl+3IoahGHq4mO0ThHuOCvqRDmqPxcV8ryuweCmo4OGE6GpctvvijAqUW1fgYj3UDdVT3srGZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HJxp8/8g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HJxp8/8g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725477128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjS+J0To6FVRmBqGu5USy4NMnRdqHmPZWkcBkzToclI=;
	b=HJxp8/8grXr4aQq+2JmU/IQPM4fX0GGbv9Gi/NYQPlTqRM2eWStj9gx/8Wa7gPvNev12Av
	mFAqhx4oOFx0syGShzPs18BIWQhwZzOLwnEdBiecyLHdQdVGSnq51weOafKBxt6x104WSf
	sSvyZloDAWmksrTG+JjAteCRSgUccrQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-Jnx4tPwoPHuKZ7PxeuHnww-1; Wed, 04 Sep 2024 15:12:06 -0400
X-MC-Unique: Jnx4tPwoPHuKZ7PxeuHnww-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5c2465b7fc1so3589135a12.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Sep 2024 12:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725477125; x=1726081925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjS+J0To6FVRmBqGu5USy4NMnRdqHmPZWkcBkzToclI=;
        b=JhRQARBvDT6eAzqXlHSk1u8aBuVm/Ba/hJsX15I76DXu7rCNEm8faOCwfTxfP8IyO5
         lIj3MItV2WUp2mp2rcR5W7JgOgHsuDxLYmk4lpCGChZpfXQ3GVPhscD059M075/yHZek
         qXwOhfObg2yxdNH3+8cXSkJjyyFrlbCickw4glGBjq23wqMguK4qeu57qMs9b7LmqE5/
         YHOGxo+EsWf3sSxoym4angSQjDZ3Q5pbHf7h+e6sltl6Qdk/lybLQ9cKNOsjIfEdDWj6
         u8jAQj0uhMLk+72zHHnefFk+OJEyKIymgyRKKko+BumgAM6Q4bdUxqFPfe0flF8tgHKg
         8xmQ==
X-Gm-Message-State: AOJu0YweonxgOdGNf+bySG4OQ0PSPNw/ae/bmsIS2v7uzwQh4aTCpieD
	r42Q3rdFqr9DuU1fKRVRZ+w7Rtc/NZ6+o/jA9zyj1obJAiABqQWLKuOWmhTfY4V64VwSfkJvXaU
	bYhaAu9lCmewbdtQ+vN+mAL0BisT8GRmldhe94ejGBCdh9MvmvW1fOR0gYItDQAKj0t/5sxc=
X-Received: by 2002:a17:907:72c9:b0:a7a:83f8:cfd5 with SMTP id a640c23a62f3a-a897f83506cmr1728239866b.18.1725477124619;
        Wed, 04 Sep 2024 12:12:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyjKhNfCOaCxIiv6uycQna1F0qrwg+75CiwEi5Uhl0ou+4uRNnGGTQ5BozarWRqgiWs0NXBQ==
X-Received: by 2002:a17:907:72c9:b0:a7a:83f8:cfd5 with SMTP id a640c23a62f3a-a897f83506cmr1728237166b.18.1725477124025;
        Wed, 04 Sep 2024 12:12:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623a68eesm25281566b.165.2024.09.04.12.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:12:03 -0700 (PDT)
Message-ID: <dfbf0064-4b8b-49f8-89ef-19a028a359ca@redhat.com>
Date: Wed, 4 Sep 2024 21:12:02 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: Add driver for AD5823 VCM
To: kernel test robot <lkp@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
References: <20240901211834.145186-3-hdegoede@redhat.com>
 <202409040751.A1Dm1pgG-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202409040751.A1Dm1pgG-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/4/24 1:59 AM, kernel test robot wrote:
> Hi Hans,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on media-tree/master]
> [also build test ERROR on linuxtv-media-stage/master sailus-media-tree/master linus/master v6.11-rc6 next-20240903]
> [cannot apply to sailus-media-tree/streams]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l-Call-s_stream-on-VCM-when-it-is-called-on-the-associated-sensor/20240902-052000
> base:   git://linuxtv.org/media_tree.git master
> patch link:    https://lore.kernel.org/r/20240901211834.145186-3-hdegoede%40redhat.com
> patch subject: [PATCH 2/2] media: i2c: Add driver for AD5823 VCM
> config: x86_64-randconfig-121-20240904 (https://download.01.org/0day-ci/archive/20240904/202409040751.A1Dm1pgG-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040751.A1Dm1pgG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409040751.A1Dm1pgG-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    drivers/media/i2c/ad5823.c: In function 'ad5823_probe':
>>> drivers/media/i2c/ad5823.c:203:26: error: implicit declaration of function 'devm_cci_regmap_init_i2c' [-Werror=implicit-function-declaration]
>      203 |         ad5823->regmap = devm_cci_regmap_init_i2c(client, 8);
>          |                          ^~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/media/i2c/ad5823.c:203:24: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      203 |         ad5823->regmap = devm_cci_regmap_init_i2c(client, 8);
>          |                        ^
>    cc1: some warnings being treated as errors


This is caused by a missing "select V4L2_CCI_I2C" I have fixed this
in my local tree and this fix will be included in v2 when I get
around to posting v2 (which also depends on the discussion
surrounding patch 1/2).

Regards,

Hans


