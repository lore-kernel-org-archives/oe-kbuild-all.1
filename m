Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA76E218E8C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734708083; cv=none; b=S+HIojIELD1TrAKpGx94qlnuz/dVIPzz0oVf7I7RpIr0z2wEjxtRbvtnGYbv83DcUYkPn7CfkGZdXsAPdtXFUYn1k1+i27lJoCKKZ4CBZFsU+gp1RwZkvrvYJ6kVynYXcrVQNbLKv465O9aIBmsC5wUfmSoccQD7VDTPcD7xW6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734708083; c=relaxed/simple;
	bh=ck0YvU0QtuvrWE4wCc1kjZDpSQ/MAPOYq/ZBUY87pZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4tozsmbN7icbUfH+GUuJa5Q1uxJj5cSX8nbr1iZ0Fty1op6rqnPx8MO1YQZH6jH0OwHbzF2qQfnsvtPaa9ULcwWBR29oj2bGcqL24iD3OpzgHNU7XasuSg/Q8dR6GdtDq+pgscDhp7CONkVb7dUuaxquKmSKcsEotkMPClXIh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKChtbt/; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKChtbt/"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fd17f2312bso1579160a12.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 07:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734708081; x=1735312881; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RJa9PU1m5xwvGpLcNORGjPUlUcTce/wfXlF3CxSQzvE=;
        b=lKChtbt/Lznk8f0gjolapKNGVViwplsh+lfyJZkfi8l1g8zIHKdK8lBdHRWa2sR2BQ
         TdKbGSR6J52n8oE2rFKGSOFaqf+FYLQO+YwdQFwwrrbb3L+11Dk6NQYkEBlcgvy72lz5
         aPhVd6qgLs0slHv6QcvStoMq5YLwv1ZT9NPhHTDBBkTLnDdWiPL9z/1Z5ISJrP9avgaY
         9QngwCQdC17VwUqHdzmE6B7sSd2JVWiftLzxDnGw0o5w7Hxm75ljUE/XxUckoSrk1k9Q
         Zvit3+6CGL0sDb1lnBJ5o8z8vcYE2D/cQ4ygiYyVWborNN0ViIPCLasr2SHXJU6I8OkN
         zTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734708081; x=1735312881;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJa9PU1m5xwvGpLcNORGjPUlUcTce/wfXlF3CxSQzvE=;
        b=T5vSjcK28x++Itn+sIHgKaX0sG/F2i9FH6V3g1MJCJBkRXCqcVYCjKCNCAw5hEM1i6
         XbgtvKqFzKtRpR1eg/q0WJ7eZaWdpjpvsGz4WzEEgeT4vfQNlSFEt/tdGhizrhSicDpe
         44aXlNBzgPXI+IKEmlCWLya3mQJg1IuLUy6dmjXpwPHxfrOaHLrrPAbv6yx0HMfErGxM
         BDWhsZFWP1ZyPkIf9pG7Y+4LX3tPjuSxR2j6PglP1xcBtAKniGFTqUKp+QBx+iNgb/AE
         jA1AnOdJBP/svecF0Jd+xDQiLtWPvNhYNd/lyjgK89WgyFoDQVizTrwqno8DxeoPlUbi
         ZHmw==
X-Gm-Message-State: AOJu0YyS4rInGxQmuRwX3GpXZB8PFX15B7HlE+wav8ShL1NOZd5Gedp5
	yprxYSUfRwWvg67oAkhISlOv9hciFIqHSl7uIfjrfPdwI0cf6tT8
X-Gm-Gg: ASbGncvC1ukq2Ja4XvSqixUccNsHNCbIIqZMNaSoY+Mp3usj0Zarvn+w3hPslgyetMb
	2X7ecHhQFUvQ3wD3aJOXBYM2GPgQkUe/Oy5/Z4hfi9mAebdV7/RGzYN8iGhObTfgQ9fi9CmLnEE
	t1XvOSSKAt8fCDQbqXyuuQoWsYWsmug8GBu2YzXNvRd6UUqufqCvvzAP6npCq2e4zhR5WUW22mQ
	0yoyCsSM3n4OdWzyTpuZt/W2gHNQnqike2/N90HLFyI7iQuwZMmcoUS+HWqihpTBaA8KZs75hnJ
	hwO6YgtFiJey2JdtfR1AeXu+YHOMJw==
X-Google-Smtp-Source: AGHT+IHntHmhvyso1/zlT8BwpR6Uf5d3WqZxyDaViPekn2mCi4BCU72ZJwsiFq8chG796SdLRDbVJA==
X-Received: by 2002:a17:902:e546:b0:215:9894:5670 with SMTP id d9443c01a7336-219e6ea26b3mr35372225ad.16.1734708080715;
        Fri, 20 Dec 2024 07:21:20 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d9775sm30132415ad.148.2024.12.20.07.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 07:21:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b8b9dc2c-cb70-41c5-8606-eb3aa6cdc257@roeck-us.net>
Date: Fri, 20 Dec 2024 07:21:18 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/hwmon/pmbus/ibm-cffps.c:184:60: warning: '%04X' directive
 output may be truncated writing between 4 and 8 bytes into a region of size 5
To: kernel test robot <lkp@intel.com>, Eddie James <eajames@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202412202139.tZ2VJL2f-lkp@intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <202412202139.tZ2VJL2f-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/24 05:54, kernel test robot wrote:
> Hi Eddie,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8faabc041a001140564f718dabe37753e88b37fa
> commit: 2f8a855efe8a6faf962c53af406e5ea4791b3877 pmbus: (ibm-cffps) Add support for version 2 of the PSU
> date:   5 years ago
> config: x86_64-randconfig-077-20241209 (https://download.01.org/0day-ci/archive/20241220/202412202139.tZ2VJL2f-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202139.tZ2VJL2f-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412202139.tZ2VJL2f-lkp@intel.com/
> 

We could use %2. 2X and %4.4X to make the compiler happy, but those are false positives.
rc is known in all cases to not exceed the format size. I don't see the point of changing
the code just to make the compiler happy.

Guenter

> All warnings (new ones prefixed by >>):
> 
>     drivers/hwmon/pmbus/ibm-cffps.c: In function 'ibm_cffps_debugfs_op':
>     drivers/hwmon/pmbus/ibm-cffps.c:171:60: warning: '%02X' directive output may be truncated writing between 2 and 8 bytes into a region of size 3 [-Wformat-truncation=]
>       171 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
>           |                                                            ^~~~
>     drivers/hwmon/pmbus/ibm-cffps.c:171:59: note: directive argument in the range [0, 2147483647]
>       171 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
>           |                                                           ^~~~~~
>     drivers/hwmon/pmbus/ibm-cffps.c:171:33: note: 'snprintf' output between 3 and 9 bytes into a destination of size 3
>       171 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
>           |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/hwmon/pmbus/ibm-cffps.c:184:60: warning: '%04X' directive output may be truncated writing between 4 and 8 bytes into a region of size 5 [-Wformat-truncation=]
>       184 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
>           |                                                            ^~~~
>     drivers/hwmon/pmbus/ibm-cffps.c:184:59: note: directive argument in the range [0, 2147483647]
>       184 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
>           |                                                           ^~~~~~
>     drivers/hwmon/pmbus/ibm-cffps.c:184:33: note: 'snprintf' output between 5 and 9 bytes into a destination of size 5
>       184 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
>           |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +184 drivers/hwmon/pmbus/ibm-cffps.c
> 
>     129	
>     130	static ssize_t ibm_cffps_debugfs_op(struct file *file, char __user *buf,
>     131					    size_t count, loff_t *ppos)
>     132	{
>     133		u8 cmd;
>     134		int i, rc;
>     135		int *idxp = file->private_data;
>     136		int idx = *idxp;
>     137		struct ibm_cffps *psu = to_psu(idxp, idx);
>     138		char data[I2C_SMBUS_BLOCK_MAX] = { 0 };
>     139	
>     140		pmbus_set_page(psu->client, 0);
>     141	
>     142		switch (idx) {
>     143		case CFFPS_DEBUGFS_INPUT_HISTORY:
>     144			return ibm_cffps_read_input_history(psu, buf, count, ppos);
>     145		case CFFPS_DEBUGFS_FRU:
>     146			cmd = CFFPS_FRU_CMD;
>     147			break;
>     148		case CFFPS_DEBUGFS_PN:
>     149			cmd = CFFPS_PN_CMD;
>     150			break;
>     151		case CFFPS_DEBUGFS_SN:
>     152			cmd = CFFPS_SN_CMD;
>     153			break;
>     154		case CFFPS_DEBUGFS_CCIN:
>     155			rc = i2c_smbus_read_word_swapped(psu->client, CFFPS_CCIN_CMD);
>     156			if (rc < 0)
>     157				return rc;
>     158	
>     159			rc = snprintf(data, 5, "%04X", rc);
>     160			goto done;
>     161		case CFFPS_DEBUGFS_FW:
>     162			switch (psu->version) {
>     163			case cffps1:
>     164				for (i = 0; i < CFFPS1_FW_NUM_BYTES; ++i) {
>     165					rc = i2c_smbus_read_byte_data(psu->client,
>     166								      CFFPS_FW_CMD +
>     167									i);
>     168					if (rc < 0)
>     169						return rc;
>     170	
>     171					snprintf(&data[i * 2], 3, "%02X", rc);
>     172				}
>     173	
>     174				rc = i * 2;
>     175				break;
>     176			case cffps2:
>     177				for (i = 0; i < CFFPS2_FW_NUM_WORDS; ++i) {
>     178					rc = i2c_smbus_read_word_data(psu->client,
>     179								      CFFPS_FW_CMD +
>     180									i);
>     181					if (rc < 0)
>     182						return rc;
>     183	
>   > 184					snprintf(&data[i * 4], 5, "%04X", rc);
>     185				}
>     186	
>     187				rc = i * 4;
>     188				break;
>     189			default:
>     190				return -EOPNOTSUPP;
>     191			}
>     192			goto done;
>     193		default:
>     194			return -EINVAL;
>     195		}
>     196	
>     197		rc = i2c_smbus_read_block_data(psu->client, cmd, data);
>     198		if (rc < 0)
>     199			return rc;
>     200	
>     201	done:
>     202		data[rc] = '\n';
>     203		rc += 2;
>     204	
>     205		return simple_read_from_buffer(buf, count, ppos, data, rc);
>     206	}
>     207	
> 

