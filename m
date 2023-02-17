Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF58376
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 02:52:28 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id 14so98078pjo.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 18:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1676602348;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u5iUXheFgWYa0lev5TedkwnVUVIifUqB68alT5VCFtc=;
        b=SPcEG6N5z4alHKVQ5V2cQm3O4DR6V8EcB2dQrkpaz0+OvnJUAx53erTnZQbdQENu1S
         l+PvqfHAJWRog6KirSgcWvCSreJmA/kyuTYwjxpHz2QFt7f6nnr6qZ2SZs/BtDPDZhU6
         5nG3EJQKwMVi5por1q5q/CtOBZfqtFEKi5YKHkYXXQ4lhAJ0mh6tro8bU7Buj5G7Jtki
         VS1aKQPZs/c+4IpyEPtzWS+WOyLBbePkebXMqbNZFa0pEwB9pnkuh9ah7ZcKnwexLBhZ
         uKWtq84yJxtMfSgLhby6I/rtbuLMAXuWhTH15MdxwuQVBar69KBIqLV8TCdmsXEXMwok
         3IUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676602348;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5iUXheFgWYa0lev5TedkwnVUVIifUqB68alT5VCFtc=;
        b=ZorI9uHftB9LQC2IJ8F4/l1YhvAosXqxyHIJpdAXeSugdh9aRscXtoBoqjn59J6NgH
         WDH+E82i2SVP3U3FMrkRsrmvLhyS1ga3gS1CVXFCJcuMphMxtSspBwdBcYmjGOVFliaQ
         GJcnBcn61wHkKIAjbW9Z4m0K4PDLVLLM4p3Y8+91cXtYaxDhoxDX3o7BKljaAiTTMAHp
         CaerasSi2gP/Y0aJBsJUEU6BMc55BwSJulw9bsw3HQsJfNGZSQqPYLUGGMDEDeNbkAIp
         F9FOq27XvheKjvqIPzo9VDnueMalIFjtZVPwTMknUAkiXP5FcD8lEl318b1ohzjqeL6M
         AMzQ==
X-Gm-Message-State: AO0yUKWFNF0OSMHj09o9MR6Q+GS3t3Wlsr7M+oYcjGv8NcOtWz9YbBeL
	65jTP3GbH7wLkNmQVB1LjLJk1Q==
X-Google-Smtp-Source: AK7set925lmZiyZCtA/cFt6vBm9gYn+r7GWJUYb7DXMmpPAdVqQNj/jsH3chAsmAbbwo8Ww6gltiyQ==
X-Received: by 2002:a05:6a20:7f8e:b0:bc:604a:5a94 with SMTP id d14-20020a056a207f8e00b000bc604a5a94mr8516170pzj.1.1676602347859;
        Thu, 16 Feb 2023 18:52:27 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id w2-20020aa78582000000b005a8cc32b23csm764174pfn.20.2023.02.16.18.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 18:52:27 -0800 (PST)
Message-ID: <f1b738b5-5ffe-9a3c-1912-08dd5f385680@kernel.dk>
Date: Thu, 16 Feb 2023 19:52:26 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [ammarfaizi2-block:axboe/linux-block/for-6.3/block 148/148]
 block/blk-merge.c:984:42: sparse: sparse: incorrect type in initializer
 (different base types)
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Ming Lei <ming.lei@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
References: <202302170743.GXypM9Rt-lkp@intel.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202302170743.GXypM9Rt-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/16/23 4:47?PM, kernel test robot wrote:
> sparse warnings: (new ones prefixed by >>)
>>> block/blk-merge.c:984:42: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted blk_opf_t const [usertype] ff @@     got unsigned int @@
>    block/blk-merge.c:984:42: sparse:     expected restricted blk_opf_t const [usertype] ff
>    block/blk-merge.c:984:42: sparse:     got unsigned int
>    block/blk-merge.c:1010:42: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted blk_opf_t const [usertype] ff @@     got unsigned int @@
>    block/blk-merge.c:1010:42: sparse:     expected restricted blk_opf_t const [usertype] ff
>    block/blk-merge.c:1010:42: sparse:     got unsigned int
>>> block/blk-merge.c:763:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned int @@     got restricted blk_opf_t @@
>    block/blk-merge.c:763:24: sparse:     expected unsigned int
>    block/blk-merge.c:763:24: sparse:     got restricted blk_opf_t
>    block/blk-merge.c:765:28: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned int @@     got restricted blk_opf_t @@
>    block/blk-merge.c:765:28: sparse:     expected unsigned int
>    block/blk-merge.c:765:28: sparse:     got restricted blk_opf_t
>>> block/blk-merge.c:763:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned int @@     got restricted blk_opf_t @@
>    block/blk-merge.c:763:24: sparse:     expected unsigned int
>    block/blk-merge.c:763:24: sparse:     got restricted blk_opf_t
>    block/blk-merge.c:765:28: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned int @@     got restricted blk_opf_t @@
>    block/blk-merge.c:765:28: sparse:     expected unsigned int
>    block/blk-merge.c:765:28: sparse:     got restricted blk_opf_t

I fixed this up, thanks for the report.

-- 
Jens Axboe

