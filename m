Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C968D139E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Nov 2022 14:36:12 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id a14so24624770wru.5
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Nov 2022 06:36:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/H7+A/Xzx9ZtihVEUgBKymwZXqW8c2bByaG/vCfZHI=;
        b=AwtkSFaIXfeGsnHDl0hoPG+lDBvJTC5YPQT72cTFxqtOny0U2r4uaG4DQ8taZ8bvdb
         JlqsVLGR4UaYGOMA8XYlXmfOQSO/nTRBgWrWB9drdBa0GznS9pu8jiWkbO1X1PxbSP1x
         VR8HRr8hLXug8j3KIXASqTx7eK00gwsonYq2bUUAL2YNITAscM5DQp+GA0jNs59xZuuJ
         wgarkHo3xYHgjU0EZYdq4ELAaAgqv7dbdTTRtYLuvRE8DoirDzFKa4ZdmCEr0EgtpmSM
         T/GtHLQKpOdWdrp87Ak2Qu1GE9KkKpzh+fNRS/GiJfaHG/yDZGq/ehBOY3EdJO+0mfic
         7eGQ==
X-Gm-Message-State: ANoB5plnW+7HaYN6Jw7gBz18KLuXoC2GYhruR4F3UelN1nBRglRs0IZT
	Ds9DEb88TIrqvT2rqua23NA=
X-Google-Smtp-Source: AA0mqf4/mqgwZG51kecqplqf/xhaal7tsWYFae+E2p7GHuE22z1z+C3A7sGfsyxm7Cd1MPXxqaZk7Q==
X-Received: by 2002:adf:fa10:0:b0:241:753d:6018 with SMTP id m16-20020adffa10000000b00241753d6018mr10164505wrr.67.1668522970925;
        Tue, 15 Nov 2022 06:36:10 -0800 (PST)
Received: from [192.168.64.94] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003cfd4cf0761sm14211011wmq.1.2022.11.15.06.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 06:36:10 -0800 (PST)
Message-ID: <7f0a07b5-ff05-7a51-3f34-1d062ae6db35@grimberg.me>
Date: Tue, 15 Nov 2022 16:36:09 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [linux-nvme:nvme-6.2 30/41]
 drivers/nvme/target/../host/nvme.h:1030:12: warning: no previous prototype
 for 'nvme_init_auth'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
References: <202211152236.4KnV3vRM-lkp@intel.com>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <202211152236.4KnV3vRM-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/22 16:21, kernel test robot wrote:
> tree:   git://git.infradead.org/nvme.git nvme-6.2
> head:   e2deb6d1a5b2dcff71f429a64fb516186aa0382c
> commit: be6cfb9fa889e8c636287335d85ebe89a74f17b2 [30/41] nvme-auth: guarantee dhchap buffers under memory pressure
> config: x86_64-rhel-8.3-syz
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>          git remote add linux-nvme git://git.infradead.org/nvme.git
>          git fetch --no-tags linux-nvme nvme-6.2
>          git checkout be6cfb9fa889e8c636287335d85ebe89a74f17b2
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvme/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>

Sent a fix.
Thanks.

> 
> All warnings (new ones prefixed by >>):
> 
>     In file included from drivers/nvme/target/loop.c:13:
>>> drivers/nvme/target/../host/nvme.h:1030:12: warning: no previous prototype for 'nvme_init_auth' [-Wmissing-prototypes]
>      1030 | int __init nvme_init_auth(void)
>           |            ^~~~~~~~~~~~~~
>>> drivers/nvme/target/../host/nvme.h:1034:13: warning: no previous prototype for 'nvme_exit_auth' [-Wmissing-prototypes]
>      1034 | void __exit nvme_exit_auth(void) {};
>           |             ^~~~~~~~~~~~~~
> 
> 
> vim +/nvme_init_auth +1030 drivers/nvme/target/../host/nvme.h
> 
>    1019	
>    1020	#ifdef CONFIG_NVME_AUTH
>    1021	int __init nvme_init_auth(void);
>    1022	void __exit nvme_exit_auth(void);
>    1023	int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl);
>    1024	void nvme_auth_stop(struct nvme_ctrl *ctrl);
>    1025	int nvme_auth_negotiate(struct nvme_ctrl *ctrl, int qid);
>    1026	int nvme_auth_wait(struct nvme_ctrl *ctrl, int qid);
>    1027	void nvme_auth_reset(struct nvme_ctrl *ctrl);
>    1028	void nvme_auth_free(struct nvme_ctrl *ctrl);
>    1029	#else
>> 1030	int __init nvme_init_auth(void)
>    1031	{
>    1032		return 0;
>    1033	}
>> 1034	void __exit nvme_exit_auth(void) {};
>    1035	static inline void nvme_auth_init_ctrl(struct nvme_ctrl *ctrl) {};
>    1036	static inline void nvme_auth_stop(struct nvme_ctrl *ctrl) {};
>    1037	static inline int nvme_auth_negotiate(struct nvme_ctrl *ctrl, int qid)
>    1038	{
>    1039		return -EPROTONOSUPPORT;
>    1040	}
>    1041	static inline int nvme_auth_wait(struct nvme_ctrl *ctrl, int qid)
>    1042	{
>    1043		return NVME_SC_AUTH_REQUIRED;
>    1044	}
>    1045	static inline void nvme_auth_free(struct nvme_ctrl *ctrl) {};
>    1046	#endif
>    1047	
> 
