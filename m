Received: from out.smtpout.orange.fr (out-12.smtpout.orange.fr [193.252.22.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6021DDA31
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jan 2025 11:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737026963; cv=none; b=ZX4jM4DQfkt1hOAHD5ZKInBxfp8hxyGVKgm2BgbRPWNrQXDM9S4QEfUWuqMjbEAB2MCufAHTq+bh+aj6WholRTgTOuctQHnCWXQ1V8SK08oRAYnUWaPmDYi0pzBaVlRBsCRHks+KWvO2NnuY9E7wm0gmQW5G7MKvYZuTHAjNAOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737026963; c=relaxed/simple;
	bh=hwM6kTZCEsgVOOzAXBO9I+brath6PnY0EDpAy7nPOtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gItoMTLoBnD4VLSma4JoalvwgtcYeZ1hq/GXl5H1NebiqpJRxNjzNpPXPovA5oCSdsOyeiHdNEZLu0Ry9NtgMZTtaxBv+Fc5Y0PVSo1uawoSaASJSTvv3AHfGfBjy6sb/zuEzOW/luL+Hc/kMsJCaKc1tQOwqTkUGAA6UeTCgZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=I2A4KFnO; arc=none smtp.client-ip=193.252.22.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="I2A4KFnO"
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id YO2btCnBV3sTZYO2gtZTJo; Thu, 16 Jan 2025 12:28:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737026890;
	bh=rtUSyHOwHuO3SLt+QntbMBsl4eURJc+p4OKX1wyf6fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=I2A4KFnOMO3xUP8SXJz7tY74vhU7G2Epbj+GLWawqbs80pPNx6GZjkBVMuw1oIulY
	 VlcKivXAI6vzsPMYmv6N3R2pqhbhYkP3umdR7rR4hIW6taon9p5RNXJz3a/AADJieJ
	 fdy8DgHqEA7WaN+ecqVorYXoMIB151SUAzCHT+Uu+NDGHlZ05rU7hvNUi/HZwjZaGt
	 +dnBnH0W8y93O/8Uzk+Cg+u2AVug8/XFQe09+zCS1eTLICPLVoC7mxokVnc+LGgnmn
	 gXc8/KZYlavxT32YBP4zJIVGgV6RtDo6lilM5p3Sk5w5QPDijO3Wxx+w0UyX5bb6xx
	 qOpDHWV2FF6XQ==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 16 Jan 2025 12:28:10 +0100
X-ME-IP: 124.33.176.97
Message-ID: <9d3f152b-53c4-422c-a3a9-dafd681a535d@wanadoo.fr>
Date: Thu, 16 Jan 2025 20:28:00 +0900
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:55: warning:
 '%02u' directive output may be truncated writing between 2 and 3 bytes into a
 region of size between 1 and 3
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Andrew Lunn <andrew@lunn.ch>
References: <202501160236.YSb9NcEp-lkp@intel.com>
 <b4df75c5-505a-4d3a-b809-ef17608405ef@wanadoo.fr>
 <Z4ijE/T0cTfyBhM9@rli9-mobl>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <Z4ijE/T0cTfyBhM9@rli9-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/01/2025 at 15:11, Philip Li wrote:
> On Thu, Jan 16, 2025 at 11:40:06AM +0900, Vincent Mailhol wrote:
>> On 16/01/2025 at 03:49, kernel test robot wrote:
>>> Hi Vincent,
>>>
>>> FYI, the error/warning still remains.
>>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>> head:   619f0b6fad524f08d493a98d55bac9ab8895e3a6
>>> commit: 9f06631c3f1f0f298536443df85a6837ba4c5f5c can: etas_es58x: export product information through devlink_ops::info_get()
>>> date:   2 years, 1 month ago
>>> config: powerpc-buildonly-randconfig-r001-20230115 (https://download.01.org/0day-ci/archive/20250116/202501160236.YSb9NcEp-lkp@intel.com/config)
>>> compiler: powerpc-linux-gcc (GCC) 12.4.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160236.YSb9NcEp-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202501160236.YSb9NcEp-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>    drivers/net/can/usb/etas_es58x/es58x_devlink.c: In function 'es58x_devlink_info_get':
>>>>> drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:55: warning: '%02u' directive output may be truncated writing between 2 and 3 bytes into a region of size between 1 and 3 [-Wformat-truncation=]
>>>      201 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>>>          |                                                       ^~~~
>>>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:44: note: directive argument in the range [0, 255]
>>>      201 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>>>          |                                            ^~~~~~~~~~~~~~~~
>>>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:17: note: 'snprintf' output between 9 and 12 bytes into a destination of size 9
>>>      201 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>>>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>      202 |                          fw_ver->major, fw_ver->minor, fw_ver->revision);
>>>          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:211:55: warning: '%02u' directive output may be truncated writing between 2 and 3 bytes into a region of size between 1 and 3 [-Wformat-truncation=]
>>>      211 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>>>          |                                                       ^~~~
>>>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:211:44: note: directive argument in the range [0, 255]
>>>      211 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>>>          |                                            ^~~~~~~~~~~~~~~~
>>>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:211:17: note: 'snprintf' output between 9 and 12 bytes into a destination of size 9
>>>      211 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>>>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>      212 |                          bl_ver->major, bl_ver->minor, bl_ver->revision);
>>>          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:221:52: warning: '%03u' directive output may be truncated writing between 3 and 5 bytes into a region of size between 2 and 4 [-Wformat-truncation=]
>>>      221 |                 snprintf(buf, sizeof(buf), "%c%03u/%03u",
>>>          |                                                    ^~~~
>>>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:221:44: note: directive argument in the range [0, 65535]
>>>      221 |                 snprintf(buf, sizeof(buf), "%c%03u/%03u",
>>>          |                                            ^~~~~~~~~~~~~
>>>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:221:17: note: 'snprintf' output between 9 and 13 bytes into a destination of size 9
>>>      221 |                 snprintf(buf, sizeof(buf), "%c%03u/%03u",
>>>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>      222 |                          hw_rev->letter, hw_rev->major, hw_rev->minor);
>>>          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> I do not have plan to fix this warning.
> 
> Thanks a lot for the detail info, we will avoid reporting again such issue. Sorry
> for the false report.

No problem :)
Compiler warning is not an exact science. A few false reports here and
there is totally fair considering the overall great service we are
getting from the kernel test bots!

>> The range is already checked in es58x_sw_version_is_valid() and in
>> es58x_hw_revision_is_valid() and recent versions of GCC are able to see
>> that no actual truncation can occur.
>>
>> I just tested with powerpc-unknown-linux-gnu-gcc version 14.2.1 and the
>> warning indeed does not show up:
>>
>>   $ powerpc-unknown-linux-gnu-gcc --version
>>   powerpc-unknown-linux-gnu-gcc (Gentoo 14.2.1_p20241221 p7) 14.2.1 20241221
>>   (...)
>>
>>   $ make -j8 W=1 ARCH=powerpc CROSS_COMPILE=powerpc-unknown-linux-gnu-
>> drivers/net/can/usb/etas_es58x/es58x_devlink.o
>>     CALL    scripts/checksyscalls.sh
>>     CC      drivers/net/can/usb/etas_es58x/es58x_devlink.o
>>
>> The warning is specific to some old GCC versions (v12.4.0 in this
>> report) on which the static analyzer is not able to take into account
>> that the sanitization done in the es58x_sw_version_is_valid() and
>> es58x_hw_revision_is_valid() inlined functions.


Yours sincerely,
Vincent Mailhol

