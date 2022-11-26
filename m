Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380C7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Nov 2022 02:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1669430213; x=1700966213;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JNCi3LJwfinnZKzD9y0LmfbvVSPVLhyEvFpV8dzXlKU=;
  b=Dp6gTNf+4lfmDgwq54BjNkzDcAf0S/tZ/TV2OX6HQWGznBiDL3EJ/gUU
   cskU5syyAyLWRuYV5CUhuhGXMaHTRYBtqJLdnVIx2S9I2Dv7ZZOZ3KNDY
   uuy957bMVCSFaQCF7FwXxGjMADBxV7C8WJwKwUJWatSasUeT3xpbtYGY0
   guZy6H7JJojG7Tsbqf909Nr1eot1L8dmBjNraalYO5xHWgMb9pOc0Knaw
   GUExp+F97VzGniL1YMH1+tjJpaMiCJ4e9mmOAfgn+AZUrsU4m21/i1BUJ
   FU6RXCMqAP4/9i3vNGY1werfu1JrQkEtyI9vk/3yuXaUzD7vpgvVHz7SN
   w==;
X-IronPort-AV: E=Sophos;i="5.96,194,1665417600"; 
   d="scan'208";a="217506251"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 26 Nov 2022 10:35:41 +0800
IronPort-SDR: EZG5WDu6ggsJgNedmw42KisER9QXx5raR/1DYCR5MRvUw3+eHMFXDIvMl6RH5EmwAvMEIXZck7
 NKeb7qeM+TKznAr+WFuK5dSzrnNHYazvjzoIJKNqbCKdH2s+9lxckPcHBrDFL3mFHhwbgyUzHl
 va2uFnX1CaEL9SRUAEq8X37CSdiiGt79oxrZjYpS28jb3RQh5btjpEOHjilDLwnIwY8xS5iz1D
 0Xj3rBI6bHIbior72+k/LqQo4ZWwf2XoJXqT3nsdFhomv0wzQSzrS51eHYP3fP3Dljepx/L9YY
 9zg=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Nov 2022 17:54:26 -0800
IronPort-SDR: CotP7HfXtFlucCvVcLSx4wL9HfJ+LiIY7fD+4HQK+m4QFWhQRzJV0qoCFDek8FETjv5c3OsAOO
 OBOpuhtRE9VhFaUnbfE5GOSiaGWvPvLSN7WlZF5vqGnyDCH/gYYA0YMpThST8htOkd+NU6N6Pb
 ZJkSvSzwHoSg0P85ayiOTsTOzGT82936y2ENtnDEw6A2l5uRYU6bjXKSylahb5L/3kkhh1FByo
 SE7DQWvZfHzLjQQHlD9yGijrrdHU3rxGLjRnKwDVRjJo+jTt8MN9EjAr5zShThVQWRXsaIU+NF
 4MU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Nov 2022 18:35:41 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NJwnn2g3kz1RwtC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Nov 2022 18:35:41 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1669430140; x=1672022141; bh=JNCi3LJwfinnZKzD9y0LmfbvVSPVLhyEvFp
	V8dzXlKU=; b=KaH6c1zurSp45XL40cO1gQU9DIBRtkyfX7OJNc5KB2QwzU8Yk7A
	kwEjTO/VVM6faxeb1kNEDx5LEeyPHe6vpC45L6w22P6UYcW1oYt+euW4P+zWvqa9
	JDunmygcRPcN5+3Yip63GHCt/S76ql3SzukzD0rgtx8KwnLbcQXwdJCjE9mvwq4p
	WoS3wHII9NJQLdhak9eguWHS+egF+K2APJ4ySn8oKP6D5xTDlORk80SubUxa9FkW
	PnE36Q1ydvkpjGOQoJD46Ql37R/biYt5AQbiDR/RGfp0HaAsi/RvJiN8O55vEYpI
	u6nQYqVt1kR4gDd9G9NcIMrNx/CEkrIMt0Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WoONt0MqPDNP for <oe-kbuild-all@lists.linux.dev>;
	Fri, 25 Nov 2022 18:35:40 -0800 (PST)
Received: from [10.225.163.56] (unknown [10.225.163.56])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NJwnl67ddz1RvLy;
	Fri, 25 Nov 2022 18:35:39 -0800 (PST)
Message-ID: <969cf476-d732-9566-63e4-01fb23fa74fe@opensource.wdc.com>
Date: Sat, 26 Nov 2022 11:35:38 +0900
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] scsi: sd_zbc: trace zone append emulation
Content-Language: en-US
To: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Cc: kernel test robot <lkp@intel.com>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Hannes Reinecke <hare@suse.de>
References: <6a21e78a188e5a0d630acd771afee11c7d45d183.1668427228.git.johannes.thumshirn@wdc.com>
 <202211151344.VGP4HoGU-lkp@intel.com>
 <7c758dc6-692c-3aeb-a0de-05e4134f839f@wdc.com>
 <yq1h6ymo3wp.fsf@ca-mkp.ca.oracle.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <yq1h6ymo3wp.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/22 11:18, Martin K. Petersen wrote:
> 
> Johannes,
> 
>>>>> ERROR: modpost: "__tracepoint_scsi_prepare_zone_append" [drivers/scsi/sd_mod.ko] undefined!
>>>>> ERROR: modpost: "__SCK__tp_func_scsi_prepare_zone_append" [drivers/scsi/sd_mod.ko] undefined!
>>>>> ERROR: modpost: "__SCK__tp_func_scsi_zone_wp_update" [drivers/scsi/sd_mod.ko] undefined!
>>>>> ERROR: modpost: "__SCT__tp_func_scsi_zone_wp_update" [drivers/scsi/sd_mod.ko] undefined!
>>>>> ERROR: modpost: "__tracepoint_scsi_zone_wp_update" [drivers/scsi/sd_mod.ko] undefined!
>>>>> ERROR: modpost: "__SCT__tp_func_scsi_prepare_zone_append" [drivers/scsi/sd_mod.ko] undefined!
>>>
>>
>> I have no clue what modpost is trying to tell me here. These tracepoints aren't
>> in any way different to the other tracepoints in SCSI.
> 
> Haven't investigated. But I get the same errors building scsi-staging
> with your patch applied. Builds fine without it. gcc 12.1.
> 

This is missing:

diff --git a/drivers/scsi/scsi_trace.c b/drivers/scsi/scsi_trace.c
index 41a950075913..224b38c0fb0f 100644
--- a/drivers/scsi/scsi_trace.c
+++ b/drivers/scsi/scsi_trace.c
@@ -389,3 +389,4 @@ scsi_trace_parse_cdb(struct trace_seq *p, unsigned
char *cdb, int len)
                return scsi_trace_misc(p, cdb, len);
        }
 }
+EXPORT_SYMBOL(scsi_trace_parse_cdb);
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 956d1982c51b..e7a0e1ace6d0 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -18,6 +18,7 @@
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>

+#define CREATE_TRACE_POINTS
 #include <trace/events/scsi.h>

 #include "sd.h"

With that, it compiles fine.

-- 
Damien Le Moal
Western Digital Research

