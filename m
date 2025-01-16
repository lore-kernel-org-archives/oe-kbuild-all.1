Received: from out.smtpout.orange.fr (out-14.smtpout.orange.fr [193.252.22.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ED11862
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jan 2025 02:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736995227; cv=none; b=FH4nBw+/F15FRjQSbQnC+94TFCDgPm/udm27IRO5T+lfdtlJZDFVCqNv5yOy/2F2LamPW8d+9bbqVYj8fkvbFKvkTWqwjW2BWDWqq7afnu6HSuH6tI6Njd1LS2yaH4VOctZ5lNckhgtw/6tL8rZH3FdEk0A1t1ONNZ0qd8AMJSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736995227; c=relaxed/simple;
	bh=qgVUo+N2S3s3ZpDVUIAGFz2Ni6Y+oVVfSQMF2VHgBA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAu+zeV0GyjjU9uBhW1XSjJkDrW/5YO9lEz2xajku5m3bcLLyCF342Xwyf//u4vnT4CG++Asuo0koep3+DaE1P6gaZiKdKlVpcYxqPfUCEUNiZpPMdqpTn2d8V+0wVDKsAoJnojQfjXdBJgtMSEgSmcE29kXHrAheO1PtVkwfZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=tOH4rAN7; arc=none smtp.client-ip=193.252.22.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="tOH4rAN7"
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id YFnjtPUI7wQZwYFnntPr7P; Thu, 16 Jan 2025 03:40:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736995216;
	bh=uTIL/DM2CBExCnDkm8uWtiOHmfnWA9geb+zxB4BxuXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=tOH4rAN7vlJjjxhSu6p+ld1sSNR+OEv9uxrMJn8sJ9baHc2gIfumuUYWHzFX/rFhz
	 niTkHWQXq5pq5dYw1UJCoARK0PFOX0sH4SZwHuEX83HmaAbdKsKvDFMG0r/evCVEmH
	 38Tv3l9LEACFYaETghv1du4SVnKDSo0gD5ovijg6AieYHSZ9psnWPnlwv4dyRNrdjT
	 mwH10o3+V+ayKAyKKcS+2tuSYBsE8j7PIJOto7cVwZRU3e6YyMbVE97NR+Hc4IHZm4
	 qViiIr/bT3XL/KZMU/VoGPJt8DI/SK/uEgoEo+kLm7SE50hrjHXYcRftQXf+TUGnQn
	 faRAgFLOZPrgQ==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 16 Jan 2025 03:40:16 +0100
X-ME-IP: 124.33.176.97
Message-ID: <b4df75c5-505a-4d3a-b809-ef17608405ef@wanadoo.fr>
Date: Thu, 16 Jan 2025 11:40:06 +0900
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
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>
References: <202501160236.YSb9NcEp-lkp@intel.com>
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
In-Reply-To: <202501160236.YSb9NcEp-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/01/2025 at 03:49, kernel test robot wrote:
> Hi Vincent,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   619f0b6fad524f08d493a98d55bac9ab8895e3a6
> commit: 9f06631c3f1f0f298536443df85a6837ba4c5f5c can: etas_es58x: export product information through devlink_ops::info_get()
> date:   2 years, 1 month ago
> config: powerpc-buildonly-randconfig-r001-20230115 (https://download.01.org/0day-ci/archive/20250116/202501160236.YSb9NcEp-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160236.YSb9NcEp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501160236.YSb9NcEp-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/net/can/usb/etas_es58x/es58x_devlink.c: In function 'es58x_devlink_info_get':
>>> drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:55: warning: '%02u' directive output may be truncated writing between 2 and 3 bytes into a region of size between 1 and 3 [-Wformat-truncation=]
>      201 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>          |                                                       ^~~~
>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:44: note: directive argument in the range [0, 255]
>      201 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>          |                                            ^~~~~~~~~~~~~~~~
>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:17: note: 'snprintf' output between 9 and 12 bytes into a destination of size 9
>      201 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      202 |                          fw_ver->major, fw_ver->minor, fw_ver->revision);
>          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:211:55: warning: '%02u' directive output may be truncated writing between 2 and 3 bytes into a region of size between 1 and 3 [-Wformat-truncation=]
>      211 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>          |                                                       ^~~~
>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:211:44: note: directive argument in the range [0, 255]
>      211 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>          |                                            ^~~~~~~~~~~~~~~~
>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:211:17: note: 'snprintf' output between 9 and 12 bytes into a destination of size 9
>      211 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      212 |                          bl_ver->major, bl_ver->minor, bl_ver->revision);
>          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:221:52: warning: '%03u' directive output may be truncated writing between 3 and 5 bytes into a region of size between 2 and 4 [-Wformat-truncation=]
>      221 |                 snprintf(buf, sizeof(buf), "%c%03u/%03u",
>          |                                                    ^~~~
>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:221:44: note: directive argument in the range [0, 65535]
>      221 |                 snprintf(buf, sizeof(buf), "%c%03u/%03u",
>          |                                            ^~~~~~~~~~~~~
>    drivers/net/can/usb/etas_es58x/es58x_devlink.c:221:17: note: 'snprintf' output between 9 and 13 bytes into a destination of size 9
>      221 |                 snprintf(buf, sizeof(buf), "%c%03u/%03u",
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      222 |                          hw_rev->letter, hw_rev->major, hw_rev->minor);
>          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I do not have plan to fix this warning.

The range is already checked in es58x_sw_version_is_valid() and in
es58x_hw_revision_is_valid() and recent versions of GCC are able to see
that no actual truncation can occur.

I just tested with powerpc-unknown-linux-gnu-gcc version 14.2.1 and the
warning indeed does not show up:

  $ powerpc-unknown-linux-gnu-gcc --version
  powerpc-unknown-linux-gnu-gcc (Gentoo 14.2.1_p20241221 p7) 14.2.1 20241221
  (...)

  $ make -j8 W=1 ARCH=powerpc CROSS_COMPILE=powerpc-unknown-linux-gnu-
drivers/net/can/usb/etas_es58x/es58x_devlink.o
    CALL    scripts/checksyscalls.sh
    CC      drivers/net/can/usb/etas_es58x/es58x_devlink.o

The warning is specific to some old GCC versions (v12.4.0 in this
report) on which the static analyzer is not able to take into account
that the sanitization done in the es58x_sw_version_is_valid() and
es58x_hw_revision_is_valid() inlined functions.

> vim +201 drivers/net/can/usb/etas_es58x/es58x_devlink.c
> 
>    177	
>    178	/**
>    179	 * es58x_devlink_info_get() - Report the product information.
>    180	 * @devlink: Devlink.
>    181	 * @req: skb wrapper where to put requested information.
>    182	 * @extack: Unused.
>    183	 *
>    184	 * Report the firmware version, the bootloader version, the hardware
>    185	 * revision and the serial number through netlink.
>    186	 *
>    187	 * Return: zero on success, errno when any error occurs.
>    188	 */
>    189	static int es58x_devlink_info_get(struct devlink *devlink,
>    190					  struct devlink_info_req *req,
>    191					  struct netlink_ext_ack *extack)
>    192	{
>    193		struct es58x_device *es58x_dev = devlink_priv(devlink);
>    194		struct es58x_sw_version *fw_ver = &es58x_dev->firmware_version;
>    195		struct es58x_sw_version *bl_ver = &es58x_dev->bootloader_version;
>    196		struct es58x_hw_revision *hw_rev = &es58x_dev->hardware_revision;
>    197		char buf[max(sizeof("xx.xx.xx"), sizeof("axxx/xxx"))];
>    198		int ret = 0;
>    199	
>    200		if (es58x_sw_version_is_set(fw_ver)) {
>  > 201			snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>    202				 fw_ver->major, fw_ver->minor, fw_ver->revision);
>    203			ret = devlink_info_version_running_put(req,
>    204							       DEVLINK_INFO_VERSION_GENERIC_FW,
>    205							       buf);
>    206			if (ret)
>    207				return ret;
>    208		}
>    209	
>    210		if (es58x_sw_version_is_set(bl_ver)) {
>    211			snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
>    212				 bl_ver->major, bl_ver->minor, bl_ver->revision);
>    213			ret = devlink_info_version_running_put(req,
>    214							       DEVLINK_INFO_VERSION_GENERIC_FW_BOOTLOADER,
>    215							       buf);
>    216			if (ret)
>    217				return ret;
>    218		}
>    219	
>    220		if (es58x_hw_revision_is_set(hw_rev)) {
>    221			snprintf(buf, sizeof(buf), "%c%03u/%03u",
>    222				 hw_rev->letter, hw_rev->major, hw_rev->minor);
>    223			ret = devlink_info_version_fixed_put(req,
>    224							     DEVLINK_INFO_VERSION_GENERIC_BOARD_REV,
>    225							     buf);
>    226			if (ret)
>    227				return ret;
>    228		}
>    229	
>    230		return devlink_info_serial_number_put(req, es58x_dev->udev->serial);
>    231	}
>    232	
> 

Yours sincerely,
Vincent Mailhol

