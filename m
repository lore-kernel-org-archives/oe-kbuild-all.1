Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C185A23A7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 10:01:23 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id b13so11990531ljf.6
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 03:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678701682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8EVi5ERJnamFr2Gsb+8yMGGkxRY6AZZMTHAy+zY/ds=;
        b=ZbczpPemcGtSDV7FvBq8HO4AIt6ZjSRx1dmY0hiI6opN2P7VUpcb4TN8MuyV2B1ncd
         K3tUxAHx6HrivDBc/ppDebQhOgF82D+ZyMnHn5Uw+SeWkOepa8RYoeFek+/BvBjBLDxa
         7hdOAQygmZICWG1SQ1i1+2DnVA/XLiVGo4yXsArwtRs6MNLvd0YkfqAiESypEPg7P1OU
         1AUVUwtAGqLOPaWu/faxlrSVqeFAGE+n9J+XmaJPBHGBW/v11YyHUffWeuk55EG9jg1W
         aKGxTeum6FHYvRhnKI6JWQt6RxG0jhASCAi8Ey1S6IbIQU6DHTyuz5m/IGrmxI862GDa
         ZdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678701682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8EVi5ERJnamFr2Gsb+8yMGGkxRY6AZZMTHAy+zY/ds=;
        b=MCIlAHyrgkee4rmeSdSLr+Wbnxp8SomjtAOjDm36rfeCYP2feByjEJcvZSKixkZp+O
         KwUy7BDp/R/I2eb8E1akpY8W5LT8frotey/hxauZfHjFOT0sK32qn+Yc4U2vaPOz9qvQ
         kvTvQx//SAlltrhvYAWON+NFTithhS/WTGiGjIIcprcevNcKEohhXqwcEPSoQ16zev4Z
         cE4DN4O5UgKbokfvWtb6pAQsak8Txe8xvx+rNBSlQGLmO828041j/Z6QkaEpwinoIBj1
         LwFkV0zJ5FpalvrXwhybIcSWyy/52jgxS7lrAXMUtjveRGfIhoBYyBFQ6pAWx4Je4YJh
         TKNQ==
X-Gm-Message-State: AO0yUKX9+IYy+8DT0RgJx7camaq61jvAPOF5/qq6pdZ8I2+MAobTIBc+
	uy7SaEp9tT7KJoY6zpFVLNR3KQ==
X-Google-Smtp-Source: AK7set9s0h6K73aYDAdMN5kpvI7uPOC8vE1OpRRr1Gnk+9BbSRSZRLnZIQBQj3kdkLkvJdJmi1ULYg==
X-Received: by 2002:a05:651c:304:b0:295:c3cf:e81e with SMTP id a4-20020a05651c030400b00295c3cfe81emr9979963ljp.19.1678701681807;
        Mon, 13 Mar 2023 03:01:21 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9556000000b0029868d1820dsm923524ljh.60.2023.03.13.03.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 03:01:21 -0700 (PDT)
Message-ID: <13ad09ae-1995-271a-1079-f9e4f6e06eb4@linaro.org>
Date: Mon, 13 Mar 2023 11:01:19 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/5] soc: qcom: Add LLCC support for multi channel DDR
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Komal Bajaj <quic_kbajaj@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Abel Vesa <abel.vesa@linaro.org>, Rishabh Bhatnagar
 <rishabhb@codeaurora.org>, Prakash Ranjan
 <saiprakash.ranjan@codeaurora.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20230313071325.21605-5-quic_kbajaj@quicinc.com>
 <202303131722.uo5Li701-lkp@intel.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <202303131722.uo5Li701-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


[...]
>    include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>                                                          ~~~~~~~~~~ ^
>    include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>                                                          ~~~~~~~~~~ ^
>>> drivers/soc/qcom/llcc-qcom.c:20:10: fatal error: 'linux/qcom_scm.h' file not found
>    #include <linux/qcom_scm.h>
This moved over a month ago. Please send patches against fresh -next
and not some ancient tree.

Konrad
>             ^~~~~~~~~~~~~~~~~~
>    6 warnings and 1 error generated.
> 
> 
> vim +20 drivers/soc/qcom/llcc-qcom.c
> 
>   > 20	#include <linux/qcom_scm.h>
>     21	#include <linux/soc/qcom/llcc-qcom.h>
>     22	
> 
