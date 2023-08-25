Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B392E107A8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 17:00:50 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso9519695ad.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 10:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692982850; x=1693587650;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1CjFi+qG+p+sZ4CVu78Dpixo5mZLjbBueijxRnXK34Q=;
        b=IkQ6V+YTkCWHQKyokwxWjl6roYYOv9LanmJqtc3OTuIiylqrURWlpqbEP9vO9vBujs
         Ft+vvmKcWQ4wpIvdNzIUpvP+Zre5/LD+OdJAYRvS4qbqxoagCod5ZI6mQjtm03JHHVri
         GleJ8eskaQpxphPdLkPCOuIdntBoVqNIbIhPuj55CjmSzYosJPXhxTEJr/tNGY6BByWp
         jBx4VPBIajctUSBCEZW90+yjLaUjzLKJ/FHhLBN/+fw+pVJIc6JbWXZNQd9SlvH8Gf4M
         Rbice4FWr2k1oGCAm02O3aQI3AvsgKC4eO7TzCJCGwz3v8UHOWi77zMctJA1yCRCIn5N
         N7pQ==
X-Gm-Message-State: AOJu0YyduaytoQ6wqzXs+V3h+Q9Zmvns8qUHmdYqKoTSi4YJCyz6DcOs
	2WXkqFMTp0JcaNm8vmrYGT4=
X-Google-Smtp-Source: AGHT+IHCdFcm1QEvF9+67ygw0GLS+LcPR7nZLB0BfAHIg6GWB7FtS71TEY3fjDDVAivi0hmtgTRMqQ==
X-Received: by 2002:a17:902:6bca:b0:1bd:f69f:9828 with SMTP id m10-20020a1709026bca00b001bdf69f9828mr15595375plt.51.1692982849780;
        Fri, 25 Aug 2023 10:00:49 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:f521:8fc8:bb3a:811c? ([2620:15c:211:201:f521:8fc8:bb3a:811c])
        by smtp.gmail.com with ESMTPSA id o4-20020a1709026b0400b001b895a17429sm1964512plk.280.2023.08.25.10.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 10:00:49 -0700 (PDT)
Message-ID: <b9c87261-9358-a76d-62d2-743d8162010b@acm.org>
Date: Fri, 25 Aug 2023 10:00:47 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [linux-next:master 5069/12910] include/linux/build_bug.h:78:41:
 error: static assertion failed: "sizeof(struct utp_upiu_header) == 12"
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Avri Altman <avri.altman@wdc.com>
References: <202308251634.tuRn4OVv-lkp@intel.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <202308251634.tuRn4OVv-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/25/23 02:07, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6269320850097903b30be8f07a5c61d9f7592393
> commit: 617bfaa8dd50d6a3ffc8694b4696bf2aa196bd44 [5069/12910] scsi: ufs: Simplify response header parsing
> config: arm-randconfig-r001-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251634.tuRn4OVv-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251634.tuRn4OVv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308251634.tuRn4OVv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from include/linux/container_of.h:5,
>                      from include/linux/list.h:5,
>                      from include/linux/async.h:12,
>                      from drivers/ufs/core/ufshcd.c:12:
>>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct utp_upiu_header) == 12"
>        78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>           |                                         ^~~~~~~~~~~~~~
>     include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>        77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>           |                                  ^~~~~~~~~~~~~~~
>     include/ufs/ufs.h:22:1: note: in expansion of macro 'static_assert'
>        22 | static_assert(sizeof(struct utp_upiu_header) == 12);
>           | ^~~~~~~~~~~~~

Can anyone tell me where to find the gcc binaries used by the kernel 
test robot? I cannot reproduce the above build error with
arm-linux-gnueabi-gcc 13.2.0 from godbolt.org.

This is the code that I provided as input to godbolt.org:

#include <stdint.h>

#define __LITTLE_ENDIAN 1

typedef uint32_t __be32;
typedef uint16_t __be16;
typedef uint8_t __u8;

struct utp_upiu_header {
	union {
		struct {
			__be32 dword_0;
			__be32 dword_1;
			__be32 dword_2;
		};
		struct {
			__u8 transaction_code;
			__u8 flags;
			__u8 lun;
			__u8 task_tag;
#if defined(__BIG_ENDIAN)
			__u8 iid: 4;
			__u8 command_set_type: 4;
#elif defined(__LITTLE_ENDIAN)
			__u8 command_set_type: 4;
			__u8 iid: 4;
#else
#error
#endif
			union {
				__u8 tm_function;
				__u8 query_function;
			};
			__u8 response;
			__u8 status;
			__u8 ehs_length;
			__u8 device_information;
			__be16 data_segment_length;
		};
	};
};

static_assert(sizeof(struct utp_upiu_header) == 12, "");

Thanks,

Bart.
