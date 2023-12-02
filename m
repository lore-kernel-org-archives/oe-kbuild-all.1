Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC374418
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Dec 2023 22:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vi/CNUNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701557682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rDiaC8gmwkqMrLrLuxIdRXvkTePXT11VS7Tvo55eZtg=;
	b=Vi/CNUNSt6Y5gJYxxbpRxkwCTT5TfEmW1/xq1w+tHPbEiegyeR5J55qP4pgiEoe5m4dKPZ
	Hi6A50i5QChbg/0LTt0xaDWB+Ggoo6oXIS3OnHuyItPiE4kPRkFUVo1x7z5iYybHoCoGZg
	kVWEiyTwIrR28Q23Pn/d1F6XQOCFy+Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-3wUvnxcDOSKLFohKMGML6Q-1; Sat, 02 Dec 2023 17:54:41 -0500
X-MC-Unique: 3wUvnxcDOSKLFohKMGML6Q-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40b53c8194cso22797465e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 02 Dec 2023 14:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701557680; x=1702162480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDiaC8gmwkqMrLrLuxIdRXvkTePXT11VS7Tvo55eZtg=;
        b=WW2BK3T/OS6DcyR3GhjzRmTKmUDSLj31F/gX6SsOczoOmuW61V0bwNOipMvjSNEgDw
         IsLGevnkc9UdSKHf3g6dCtUK19zw0sejLT30A3RygaVNdlMXbUvIxfOLEOVSDYYLmd+p
         HjPvzsu3ghl7h3MYcfmfGH9IB6aZFEw8wT4m+YLY4jP9jrlpGHxYUaL+6TL7vIh5S3uZ
         GD5Yx+W2ZWLcqyz/X4vNFffnIrOPiwqvWjhNu9aJn9rHF5tKqhu1+EJex7VPinqH8XLN
         o6fcwNUVRQjfGpIWL8LqbUwi6g8cNuMQ9OIpyxo7cLQzrTYtJTeVCIYmLhV7rQ7GkkFP
         nlFQ==
X-Gm-Message-State: AOJu0Yxq7vcUyFVd+iz+8Y5mL/CNlcElbHYi06JrIjbJYEUMMNa3aWPt
	ZPVi5fojEBheJatbIAPQZlLtOlpVh6hQFqVIe61drNa2RWJSMrkBkH8xX9x22JLMLiH8ULEB/qT
	S+FRcMTOS6O8vqKyianACcFdA7DAa7zMj/A==
X-Received: by 2002:a05:600c:198d:b0:40b:5e21:bdc6 with SMTP id t13-20020a05600c198d00b0040b5e21bdc6mr1211080wmq.85.1701557680057;
        Sat, 02 Dec 2023 14:54:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY8pqdK1WJw1JXBRTVAxbTjAVl1rJubin/wp1neDj4YG+JD2TCeIIIjK/TgzpIx/QlBPfVSQ==
X-Received: by 2002:a05:600c:198d:b0:40b:5e21:bdc6 with SMTP id t13-20020a05600c198d00b0040b5e21bdc6mr1211071wmq.85.1701557679157;
        Sat, 02 Dec 2023 14:54:39 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x24-20020a1709064a9800b00a0cd9d89a00sm3510588eju.151.2023.12.02.14.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Dec 2023 14:54:38 -0800 (PST)
Message-ID: <53fd830a-0f92-4d02-b407-bd93497e751b@redhat.com>
Date: Sat, 2 Dec 2023 23:54:37 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/extcon/extcon-intel-cht-wc.c:153:3: warning: this
 statement may fall through
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <202311220741.oIvJcjV4-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202311220741.oIvJcjV4-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/22/23 00:27, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c2d5304e6c648ebcf653bace7e51e0e6742e46c8
> commit: de85d79f4aab67fe0537dd6e2c5d545b88239cc4 mfd: Add Cherry Trail Whiskey Cove PMIC driver
> date:   6 years ago
> config: i386-randconfig-002-20231120 (https://download.01.org/0day-ci/archive/20231122/202311220741.oIvJcjV4-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220741.oIvJcjV4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311220741.oIvJcjV4-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/extcon/extcon-intel-cht-wc.c: In function 'cht_wc_extcon_get_charger':
>>> drivers/extcon/extcon-intel-cht-wc.c:153:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>       dev_warn(ext->dev,
>       ^~~~~~~~~~~~~~~~~~
>        "Unhandled charger type %d, defaulting to SDP\n",
>        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         ret);
>         ~~~~
>    drivers/extcon/extcon-intel-cht-wc.c:157:2: note: here
>      case CHT_WC_USBSRC_TYPE_SDP:
>      ^~~~

I have no idea why lkp is reporting this warning now, this has long been fixed, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/extcon/extcon-intel-cht-wc.c?id=962341b54b99965ebec5f70c8d39f1c382eea833

Regards,

Hans



