Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5817815AC1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 17:41:48 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-666e916b880so3946438b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 10:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689702107; x=1692294107;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnL+4eKchlLBqgnSWUCxwrOR90ZM8MoCkVgnRaAJ/yw=;
        b=bSgllWbBxTuWSxhcS3M9xTv7rC8OOca+DhDklIPMe1CNFCn4ED+uCw5NhIvLwr5k1N
         thH6rcNzlL6u63k+nXVnClW+NAWDGbzSWmvG1fsUXq/jl+aX5Y6IyFqPY5loc4okVjUt
         x78GjR5Dli4ZA8kf0khmUv/FplX9/A670NI0kT9+e9tmRAp8pkK8WZgM7WZL+pIarZ3e
         nWWjApLOet+vl93SysRqecCOcExQ5SF3z2Q9TMtHc07Wztw959c6Yh4OFAikfljJv5+E
         b75/4bCH6yK+bfzTqC+EHnMV5ouQmpe3p/oat1SVo+DpjJiP7BsdENGzdlnlA1G/exmq
         XjWw==
X-Gm-Message-State: ABy/qLaAKc6Sa86aHwNiVIeHh7BEChtsBnicbpThy1xht4kZYo4zzmkP
	khSXLmWV8oOCAdhTOF/8YUs=
X-Google-Smtp-Source: APBJJlFMjxAGNSqk7Xskn10VK+CT7TqmjQOsoxG7nsj5kaMYy38+GJxJUY/shnn+C4xqlIUbvgDeEg==
X-Received: by 2002:a05:6a20:a10c:b0:134:589a:cdcb with SMTP id q12-20020a056a20a10c00b00134589acdcbmr8313536pzk.12.1689702107424;
        Tue, 18 Jul 2023 10:41:47 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:3cb6:9d30:79d0:90cc? ([2620:15c:211:201:3cb6:9d30:79d0:90cc])
        by smtp.gmail.com with ESMTPSA id c9-20020aa78c09000000b00682a61fa525sm1864201pfd.91.2023.07.18.10.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 10:41:47 -0700 (PDT)
Message-ID: <d50271d5-c3b4-44b1-769b-be200c4577df@acm.org>
Date: Tue, 18 Jul 2023 10:41:44 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH] scsi: ufs: Remove HPB support
To: kernel test robot <lkp@intel.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-scsi@vger.kernel.org, Avri Altman <avri.altman@wdc.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Bean Huo <beanhuo@micron.com>,
 ChanWoo Lee <cw9316.lee@samsung.com>, Daejun Park
 <daejun7.park@samsung.com>, Keoseong Park <keosung.park@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Lu Hongfei
 <luhongfei@vivo.com>, Daniil Lunev <dlunev@chromium.org>,
 Jinyoung Choi <j-young.choi@samsung.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Asutosh Das <quic_asutoshd@quicinc.com>, Can Guo <quic_cang@quicinc.com>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Chu
 <stanley.chu@mediatek.com>, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
 Arthur Simchaev <arthur.simchaev@wdc.com>, Jens Axboe <axboe@kernel.dk>,
 Markus Fuchs <mklntf@gmail.com>, Po-Wen Kao <powen.kao@mediatek.com>,
 Eric Biggers <ebiggers@google.com>
References: <20230717193827.2001174-1-bvanassche@acm.org>
 <202307190020.oxUXDCH1-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202307190020.oxUXDCH1-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/23 10:02, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> 
>     drivers/ufs/core/ufshcd.c: In function 'ufs_get_device_desc':
>>> drivers/ufs/core/ufshcd.c:8092:12: warning: variable 'b_ufs_feature_sup' set but not used [-Wunused-but-set-variable]
>      8092 |         u8 b_ufs_feature_sup;
>           |            ^~~~~~~~~~~~~~~~~

I think the above warning can be fixed as follows (will fold this in
when reposting this patch):

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index e40b71c8dbc0..c394dc50504a 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8089,7 +8089,6 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
  {
  	int err;
  	u8 model_index;
-	u8 b_ufs_feature_sup;
  	u8 *desc_buf;
  	struct ufs_dev_info *dev_info = &hba->dev_info;

@@ -8118,7 +8117,6 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
  	dev_info->wspecversion = desc_buf[DEVICE_DESC_PARAM_SPEC_VER] << 8 |
  				      desc_buf[DEVICE_DESC_PARAM_SPEC_VER + 1];
  	dev_info->bqueuedepth = desc_buf[DEVICE_DESC_PARAM_Q_DPTH];
-	b_ufs_feature_sup = desc_buf[DEVICE_DESC_PARAM_UFS_FEAT];

  	model_index = desc_buf[DEVICE_DESC_PARAM_PRDCT_NAME];


