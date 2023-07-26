Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDB7DDA8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 23:53:37 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-55b1238a013so249031a12.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 16:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690415617; x=1691020417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NRyGMlHg9fFAepKXgOzg271kQtVxYUgZIbTQ9lTP6NY=;
        b=kcU/e5pFPS9y31sgQTgN08WUZfesShj2GqSEle0SCoWqdkhc7YUOJtOKdLhRlJdguK
         Kg51Q1W0ynLcNxX8sjoXQwEq09CgOYc3roQbSzDEJDOD87TLyDaS7dmarlV3JnRtaSnc
         iqJEvUHvgyYq9mQd0L/m62HTZkFmtby/dPmuYX2i1BVjZyZxrPBV/8EzKdyYscLJ/ehW
         clrlrF41NDR11L30O8IJomqwl068TuGk32n21SLibFj3JN/Dmz8j12H71ZScudMmPbnf
         rQDgdwZ6BWppAGA49tUceBhP84L2RcQqMBpR5Uzr7sZHQyahKcYiNx286ylU/lxMZko7
         2uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690415617; x=1691020417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRyGMlHg9fFAepKXgOzg271kQtVxYUgZIbTQ9lTP6NY=;
        b=kSSz6NC7p1G5ianmZdEC66+caOR0vvzpS3KH8SYE43DsUfx4XrLUjQobtt3AJKw3n3
         2lSXmjZrdbLvumsoZ7MhkfnpUmkMqifgl0n1z24IrMay1ru1rFBBmZa1diYOCHdsd9Ql
         E1TLW7u/HiK+Oix9jlVkVntEsqws3moT5vVmcLEiCVV/nO2hjudGCkvNvzEs6ShhI15y
         S60w4BJH3iw6UXJR79rw/KK/OH0OUrkdCoPULQ/PrFwVc1iseKjfKmOpfGlhuGdd1oNP
         DjinToYI+GxhdBKW+GnSR+gTehS/oxwEsoYmk4vYOWj/NiRn1cfYhFKhiw9TZj5M0IXE
         Epig==
X-Gm-Message-State: ABy/qLbPTbw6mY+K1z8U8QEQSLpPDnKNWW9nzW8lm91ECryOlZAjvfYt
	zRq5WQHQHNQ/aQ5p0h+0OzY=
X-Google-Smtp-Source: APBJJlGO7XI1TFSDP3DUo347+WApNWEmMsvb6JH5QETEM2KOi/mude959dCNNT9+edQ0H6fNew6wBw==
X-Received: by 2002:a17:90b:4b8f:b0:261:2a59:dc38 with SMTP id lr15-20020a17090b4b8f00b002612a59dc38mr3614225pjb.25.1690415617026;
        Wed, 26 Jul 2023 16:53:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ep11-20020a17090ae64b00b00262eccfa29fsm1711028pjb.33.2023.07.26.16.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 16:53:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f67f7165-bad6-3e77-2ec1-f9c37eb3ac0d@roeck-us.net>
Date: Wed, 26 Jul 2023 16:53:35 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [groeck-staging:hwmon-next 35/36] htmldocs:
 Documentation/hwmon/hs3001.rst:4: WARNING: Title underline too short.
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Andre Werner <andre.werner@systec-electronic.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <202307270449.YQ4vCUwO-lkp@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <202307270449.YQ4vCUwO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/23 13:39, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> head:   c944c8c532f7bd6d9e52ee3e2e97dcdd9c6014c0
> commit: 33faa6fcc93f78e6b0e9b5aaf986446ac3c34047 [35/36] hwmon: Add driver for Renesas HS3001
> reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270449.YQ4vCUwO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307270449.YQ4vCUwO-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Documentation/hwmon/hs3001.rst:4: WARNING: Title underline too short.
>>> Documentation/hwmon/hs3001.rst:34: WARNING: Missing matching underline for section title overline.
> 

Andre - no need to send a fix. I fixed it up.

Guenter

> vim +4 Documentation/hwmon/hs3001.rst
> 
>       2	
>       3	Kernel driver HS3001
>     > 4	===================
>       5	
>       6	Supported chips:
>       7	
>       8	  * Renesas HS3001, HS3002, HS3003, HS3004
>       9	
>      10	    Prefix: 'hs3001'
>      11	
>      12	    Addresses scanned: -
>      13	
>      14	    Datasheet: https://www.renesas.com/us/en/document/dst/hs300x-datasheet?r=417401
>      15	
>      16	Author:
>      17	
>      18	  - Andre Werner <andre.werner@systec-electronic.com>
>      19	
>      20	Description
>      21	-----------
>      22	
>      23	This driver implements support for the Renesas HS3001 chips, a humidity
>      24	and temperature family. Temperature is measured in degrees celsius, relative
>      25	humidity is expressed as a percentage. In the sysfs interface, all values are
>      26	scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
>      27	
>      28	The device communicates with the I2C protocol. Sensors have the I2C
>      29	address 0x44 by default.
>      30	
>      31	sysfs-Interface
>      32	---------------
>      33	
>    > 34	===============================================================================
> 

