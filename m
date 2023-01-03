Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA79374
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jan 2023 04:45:55 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id a11-20020a17090a740b00b00223f7eba2c4so2239286pjg.5
        for <oe-kbuild-all@lists.linux.dev>; Mon, 02 Jan 2023 20:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5r2SpeKo/dsm6TJm7k5ZEFJZ1B6qJV7pDaoh0+GMrDA=;
        b=PIMtxS4MCr2yd/V98x1M0WVzhwxok8v0zFDS5ob3HM8+hLK8f1YQECXRa9GkngJQ19
         mw526XmfUqCJiahu24KKtaReMK8svdyTnqNguRFFM3IqH9yToQyX90MR7clsc9t0gG89
         hgS6jqF4kMadta8wcMwaqNyE40Xcl68I4ve4CW0l4KecOfUjqkDOlAMS7YWjMkk/hyc9
         Wl9RfD9Ba7vfCfrYpADX4TTQcHYulXzMlGd/Je7xPIcDHV0STP1sNbFtBu6/dGBIjhGT
         i4hv92Okma105aXB245HF8POGL9h8QfcxH2BNh4im2fSazQWtTwxGyNVRw7BhXQM087B
         H/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5r2SpeKo/dsm6TJm7k5ZEFJZ1B6qJV7pDaoh0+GMrDA=;
        b=baNUnivp1rJC4iyPWGixTqE0lQogpwhgigDkGeYMjEJJDwskjiQkGjaajjcaylNM1o
         uYQ9UX3DaYfecvnL7BwU6htnQ1e9d73kBQr6mT7ElvQE1USqx6vfZaWWFGbqgIn+lG6l
         dgT4UkTeF53yYZX+dkf6iu/g7x28DFhz4pxssWZqFjg/bCZzN5GY3Oe5RYGbSfojsK2g
         5yio0mmLnJoo79VJ7uv8KkC/MFxoamk3Me8ENOx54iLpfYKmZ09X6+Qy1j6WPX0ayidO
         Nz7Z4+10pwE+6G17cojIqrC1sSmqEg0A7jOhu7NMjYi+agQ4ikXGELPKyGzAb0uQ8tuL
         0OHQ==
X-Gm-Message-State: AFqh2konKTYCn/pUTwyfFK4yntXjYK9fkr00nKrWAbV9NV1pBi2r247Q
	YwNhk1wqKI2YS4xBWXvvfbQU0w==
X-Google-Smtp-Source: AMrXdXuXqoCFzqofEoGdlX/Jo/KW97I/INTMOP7PlP95lQMRtK8ZZV8x9HRIX/rd3Br9I+nSrXs4eQ==
X-Received: by 2002:a05:6a20:8ee1:b0:ac:3f3f:9fbd with SMTP id m33-20020a056a208ee100b000ac3f3f9fbdmr43533668pzk.48.1672721155036;
        Mon, 02 Jan 2023 20:45:55 -0800 (PST)
Received: from ?IPV6:2401:4900:1c5e:e3b5:c341:16de:ce17:b857? ([2401:4900:1c5e:e3b5:c341:16de:ce17:b857])
        by smtp.gmail.com with ESMTPSA id x7-20020aa78f07000000b00580f630a05csm15555599pfr.180.2023.01.02.20.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 20:45:54 -0800 (PST)
Message-ID: <3db705bf-d63b-2804-53d3-4e538722369d@linaro.org>
Date: Tue, 3 Jan 2023 10:15:48 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] usb: misc: eud: Add driver support for SM6115 /
 SM4250
To: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_schowdhu@quicinc.com,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 bhupesh.linux@gmail.com, robh+dt@kernel.org
References: <20221231130743.3285664-3-bhupesh.sharma@linaro.org>
 <202301010719.babWy02L-lkp@intel.com>
Content-Language: en-US
From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <202301010719.babWy02L-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/1/23 5:29 AM, kernel test robot wrote:
> Hi Bhupesh,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on usb/usb-testing]
> [also build test ERROR on usb/usb-next usb/usb-linus robh/for-next westeri-thunderbolt/next linus/master v6.2-rc1 next-20221226]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Bhupesh-Sharma/dt-bindings-soc-qcom-eud-Add-SM6115-SM4250-binding/20221231-211214
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> patch link:    https://lore.kernel.org/r/20221231130743.3285664-3-bhupesh.sharma%40linaro.org
> patch subject: [PATCH 2/2] usb: misc: eud: Add driver support for SM6115 / SM4250
> config: arc-randconfig-r043-20230101
> compiler: arceb-elf-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/b5caddbdc606744113a894749b7457e5b2621678
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Bhupesh-Sharma/dt-bindings-soc-qcom-eud-Add-SM6115-SM4250-binding/20221231-211214
>          git checkout b5caddbdc606744113a894749b7457e5b2621678
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
>>> ERROR: modpost: "qcom_scm_io_writel" [drivers/usb/misc/qcom_eud.ko] undefined!

Thanks for reporting the issue. I think 'select QCOM_SCM' should be 
added to 'config USB_QCOM_EUD' configuration option as well.

I will send a fixed v2 shortly.

Regards.
