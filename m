Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE198F7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 06:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711087536; cv=none; b=jFQL+rG2B8qsidrC8LoL2IKt4BuKRFNZp7J8Y9hwTGYlk3I3PTqe+CJqUomENsWTRWe+sFKblEUBRWSNU7XN97kNoFFroxdVsrp07sMeE5E8tLWt+ekJKKlLzyKDkasiJUTnN5kg0/uCIRp01qEeBWjjJfyeIBetsMlH5yCBk48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711087536; c=relaxed/simple;
	bh=eih1aweGSM0dYHODdcengszpxb98GhfvPJYrPzGZVwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbAF8vDIKjNCk6ohkILOw6XTCUz+6p9JOUd7hTH0p/WZ6QTcEPuERpAk6juu/UzMCvjrT52xZZBlb/9bTEL2Z2iL5fGqGlSlFUlvsI2Njs9QbNdN3PZk+gugTO+AAW88LTzTCcYzcuvn3hio7FYenz+p5oYUBHZF2aezx7XGKNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=ikBjNVjV; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="ikBjNVjV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711087523; x=1711692323; i=deller@gmx.de;
	bh=nFWfSNE+sDLN3T5W5yTOCJvmuWqyKzz/qc8vtjfwPGE=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=ikBjNVjVd5iaTg20EpLabFLvU9DGCM/NjoFRsK0L66C1QJyQ+Fg4LZfChVfw+Zzf
	 h1EjGepRWp+n/11Brhz3weEvzSx3pUY5uXjqSMy3zpgWFLHFZ1RAUKWo/y9ZzNw+X
	 EPtGscbQt+FJIZMt547dYvQ+bzzun0+IK67UiraZ2TLz3/G6rULu76IVKm856lvEx
	 RiCDHqR392f9zR6ixKTFjrV3ub6Vg/h/jA+/xknB1RAKKG1xDYCQ1cYVFJoel2c0a
	 aaPGbX28YnmUEhzkd1yonA5vFuvGmuvYgfa7HUSSCPetjuqyNPh2buO1Jq9eCNLap
	 HX5UfZ7s6ONuKQKzvg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([89.244.180.187]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma20k-1rHjQl0WGK-00VzFs; Fri, 22
 Mar 2024 07:05:23 +0100
Message-ID: <5ba282de-d84a-4b06-a26b-548182002996@gmx.de>
Date: Fri, 22 Mar 2024 07:05:21 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 13900/14187]
 drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c:228:13:
 warning: unused variable 'ret'
Content-Language: en-US
To: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
Cc: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <lkp@intel.com>
References: <202403211931.wVl6ymAV-lkp@intel.com>
 <be3df018-7c1c-425b-851f-41427fa2a548@fujitsu.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <be3df018-7c1c-425b-851f-41427fa2a548@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:W1wsGd/nX54S0dtiXDVVc7qkeCPmyH1+IYrkK4WXdgt9KfT0rnR
 oA53KWhw1iRHHKQ6vkBiqjam6ek+7Hv4+z/JRHVZ9O3vHmj0TW0+k2Q1wkPcesDMbLPgtX7
 c8pEruxwNsokEHgD/qdnHzBDGau1/8K6gPJGCbSIPV7VvbJplWR9pQo2onerjZ0hd1MNVeW
 XGnSO+/GhaIA0piiOi88g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nh3VleIdJZ4=;r6LldqBFEJQaS+f0QlkLMyBzXDf
 PI7XMpg/+M6HudRJKvOG8AfONaYz006oepyu9ljZQDJsi2klAAIXAk2okLj0zsvFHO/YDI0NC
 flAapqWEkX8aMMG8ubiv8pvcsDm5gO4AfT5w9yuV83YxtvmMA0lLnBfWhtkd4E12CD9dQYOg2
 4H5I67jAIi3V2gKzJvygIO1Ow6HJSKnaWRYxvvtoa1tXAp2mtBHkreSj5s8cr4FcsPzD4bqf9
 48IozT7Q1Zhcu8s1QLwOHFcrDBxz51ZJyO25lNg33ZFm7zMjPeKRFX8JWr28AAnn/9XTTm7I6
 6bRGlTA3JEkN44Bon+y77HO1SmqX2wiRb1xsjfpeLDr0qHfY1Wu+yp68DzKIIkloNjz3tEaVU
 AKQioqwbrXF2cFfOrsN8nvAekQCkrgIrY+lYWs0scN0hntcKXQj+pg7KrHe6SOfnVHd7PUn19
 wNns8Kr+IGgry1h1o1c7nHaiLkEccNLRWhYtdM+zeAZd0N7iNnSuB7JbswLOQKdVomz/J/+ds
 PrqxfgoXw3/tKJPjRanXfXMcclJZ51cIdzHmJicav/0ZCU0cIjlGXrjlZh+3e4hypi/7OdMFw
 5XemWEgSlz6m0z4axb0NwXiHq/cH0FgV8QjTFkFlvvbqyPfzxLtq6QMeF49zGt46TECl9P+lg
 VMD8lz4bi9pF4aTOn/f8YAwoGWY2s+iH66792u2+HK5xWxm/fRJVhGWocovI1+iJgfgvKMw21
 ERA1xJXb/GH38s1Q2htIP8O0wjn3Ouy5Ztos6njc+wdpZCb+IiX8PUZWId/7K6w/B957vKQdl
 gLCFufuPbZksfixqkU7o9mw2XUL4We97/JWAtQgnhoXls=

On 3/22/24 03:54, Zhijian Li (Fujitsu) wrote:
> Helge
>
> Should I send a new version(v4) to fix this.

No, it's ok.
I've fixed it up already.

Thanks!
Helge

>
>
>
> Thanks
> Zhijian
>
> On 21/03/2024 19:56, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
>> head:   e7528c088874326d3060a46f572252be43755a86
>> commit: 0688d3b1d882dd1dcf73305306e71ebf1653f595 [13900/14187] fbdev: p=
anel-tpo-td043mtea1: Convert sprintf() to sysfs_emit()
>> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/202403=
21/202403211931.wVl6ymAV-lkp@intel.com/config)
>> compiler: sh4-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240321/202403211931.wVl6ymAV-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202403211931.wVl6ymAV-l=
kp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>      drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c: =
In function 'tpo_td043_gamma_show':
>>>> drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c:228:=
13: warning: unused variable 'ret' [-Wunused-variable]
>>        228 |         int ret;
>>            |             ^~~
>>
>>
>> vim +/ret +228 drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td04=
3mtea1.c
>>
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09  222
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09  223  static ssize_t tpo_td043=
_gamma_show(struct device *dev,
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09  224  	struct device_attribute=
 *attr, char *buf)
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09  225  {
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09  226  	struct panel_drv_data *=
ddata =3D dev_get_drvdata(dev);
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09  227  	ssize_t len =3D 0;
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09 @228  	int ret;
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09  229  	int i;
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09  230
>> 0688d3b1d882dd Li Zhijian     2024-03-19  231  	for (i =3D 0; i < ARRAY=
_SIZE(ddata->gamma); i++)
>> 0688d3b1d882dd Li Zhijian     2024-03-19  232  		len +=3D sysfs_emit_at=
(buf, len, "%u ", ddata->gamma[i]);
>> 0688d3b1d882dd Li Zhijian     2024-03-19  233  	if (len)
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09  234  		buf[len - 1] =3D '\n';
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09  235
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09  236  	return len;
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09  237  }
>> f76ee892a99e68 Tomi Valkeinen 2015-12-09  238
>>
>> :::::: The code at line 228 was first introduced by commit
>> :::::: f76ee892a99e68b55402b8d4b8aeffcae2aff34d omapfb: copy omapdss & =
displays for omapfb
>>
>> :::::: TO: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> :::::: CC: Tomi Valkeinen <tomi.valkeinen@ti.com>

