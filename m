Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B6D46BA8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YBHmbshd"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c9f559b82cso13644311fa.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 07 Dec 2023 11:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701976246; x=1702581046; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OfswJHbbaE8lthgCuxsCEF+7HdLrX0KCYICyRwFYL8Q=;
        b=YBHmbshdIbC4VGyZ4IUnSwfC4MzncuM2Icq3IUHn43iRYvuay0xbud4bdsT028x1rG
         rJKCrxYFyHobP92/mu6fmtmwAFonHKQ1EhUuR00+D/j1h0zAvkwHTewJy7C0zD04VFHk
         saxloY1DEyxqSEaWUINs53B7VzJjzC0Bq7flAYJHWekyuegFwlVRCpQpSemOMSfmbtUg
         liGv7kIQkRrQDTRSRcc3MDogJhiD7cRqNyu0U8alAUVhRmuIaEtYqSAnr1ZlLoJK1Qca
         FvIBMKNDCc85kNYHXJ4d2Yocez7HJhPXBkRUODgwt6R2Hf2G8l6LyjEZbKmjBVEoW2Bz
         ETSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701976246; x=1702581046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfswJHbbaE8lthgCuxsCEF+7HdLrX0KCYICyRwFYL8Q=;
        b=HRAZGRsmgR3Qx19hSbVGxv3k7u5BIK8Pc7AIM4A2e4JkpyX/paJNs9tQ5RwLQRptQh
         q9vE5wiM/HsMTgUY5cOaHIWD8AoJGgItuOICo1xHsEnnC++C3ygVi6KhF498iyL4SPJP
         R4D0DkjTH6JYUcSWMoTWwh9cFi0LduCgyWCZ41NE1iMJd5PJtdQrQ2yCxHstao33fMz3
         flqJB+Z8gG2JHRjmgo/23arxcvdqo8VC6eWNadMl+8X11ew+URiZIx9JX7KEfKTC76Og
         /EO5hJAlMauZrPZ+Si0106Y5F9i7D+jD89dteZfMnuZNebzOwFPp5zeBQ57G6LDYOn6B
         bbWA==
X-Gm-Message-State: AOJu0YwZDwpYvyttSXanWqoXnzDYAg5vWiIUPpcWx0WU/46I6CWFWfEu
	nwtInuia9QNPsHJLmqvwFFlO/A==
X-Google-Smtp-Source: AGHT+IHHZzDwVjEoqj5L0COX7ANyUFp8QKEMmxG3cMwdjoXkbsmuUH84Uxh48VDZssIMNDNTOto8AQ==
X-Received: by 2002:a2e:9991:0:b0:2c9:c8f4:1c0c with SMTP id w17-20020a2e9991000000b002c9c8f41c0cmr1649768lji.32.1701976246456;
        Thu, 07 Dec 2023 11:10:46 -0800 (PST)
Received: from [172.30.205.181] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e9b52000000b002c9f75a48fcsm23408ljj.16.2023.12.07.11.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 11:10:45 -0800 (PST)
Message-ID: <014a4a44-0da2-49e9-ab1c-f4cc1ca2e218@linaro.org>
Date: Thu, 7 Dec 2023 20:10:41 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: Add MSM8909 interconnect provider
 driver
To: kernel test robot <lkp@intel.com>,
 Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
 Georgi Djakov <djakov@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>
References: <20231206-icc-msm8909-v1-2-fe0dd632beff@kernkonzept.com>
 <202312071325.M9cg1wry-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <202312071325.M9cg1wry-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/7/23 07:06, kernel test robot wrote:
> Hi Stephan,
> 
> kernel test robot noticed the following build errors:
(.remove -> .remove_new)

Konrad
