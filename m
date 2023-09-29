Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB0A2119
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 07:13:09 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3248e90f032so1190646f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 00:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695971588; x=1696576388; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VH2OdY8PA3jmJonW2IObtpUNilldFdxREyN9dCrnPck=;
        b=KcAHQa2Ioya/r+X8jCLavg/8GMeOFVyfAnmDW3r/bquCtUfk/6LTjQg5amo6B0HYFG
         JvGek0QQncKLaQNMN9gKdsCRygl7l9lgj2vHrsH5YkY3d552m7RAkPyEv0KNx9nNX28z
         o0f+oHkozzjYGuoPuAxWT4HL+4SHpGgrEbBhrDeVKk6lx1Onscp/ddpUUXia9iq37bh4
         s9mGAaPrQVzQWLMd5ehTgu1aSqJxchtgwiROT/Ay0Iq2y8PMNYUNuOhEkDIxLlALLBBQ
         4sPYCQqGK8HRWcSrWUf/G6+j/XoOHqjTAiJY4Q88qrH9iXuX6O5whtHOnwQxU3HgySNu
         cLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695971588; x=1696576388;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VH2OdY8PA3jmJonW2IObtpUNilldFdxREyN9dCrnPck=;
        b=FA/5qjLV7WsEXYYwpD2yCrcdnVYEYs75xKA43Q+S1bvlYY1FqfCK0IN0Js1bWIPaBD
         h9kyWW0/p7r1WGRhQq5S33iF4HJogReHaewc4da5MW7sNRM/1Bw5OQwo2c7svNKIhk1U
         dAqLwSpFsQQDribN/iRCuAkcvDRm9dxl5x8Ad3WA9kuXFJ9RkS3zuDTR1WRBspJNkvd1
         oJVjX+/jERktzeISLxT6tiN17h6gT3wNRzmwUrQbUlEYTPFy8jjahAR9Ysq45aqxAjru
         1FsJjtDFmIeE6wLcr18ASIStVDALTkEbfyxUg2B0hXGjngAwbmUmCuuLCb/aN8QHnvl6
         O9lQ==
X-Gm-Message-State: AOJu0YyRbNbPqI5JbVHuA7f6D1Rz753Gm6+2ZpBoqXA/13Y+d0WnOEPj
	0ySoYt0e/bfFamwle4XOCcQK/g==
X-Google-Smtp-Source: AGHT+IGjkS9K8wXRgIqCCc6VdHtVzo14jXkL+KJZtiHA+bwC8ttsQXbuB1lG9aNRhCIJgDpwvNHhCA==
X-Received: by 2002:a5d:49c2:0:b0:322:5251:d798 with SMTP id t2-20020a5d49c2000000b003225251d798mr2805804wrs.70.1695971587877;
        Fri, 29 Sep 2023 00:13:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x15-20020adfcc0f000000b0032330e43590sm9387301wrh.22.2023.09.29.00.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 00:13:07 -0700 (PDT)
Date: Fri, 29 Sep 2023 10:13:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Stefan Binding <sbinding@opensource.cirrus.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Subject: sound/pci/hda/cs35l41_hda.c:304 cs35l41_request_firmware_files()
 error: double free of '*wmfw_filename'
Message-ID: <4fe6a89d-372c-45f7-a7d2-7b8f376d983f@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9ed22ae6be817d7a3f5c15ca22cbc9d3963b481d
commit: cd40dad2ca9196631dcd48e1b991244ab3940d83 ALSA: hda: cs35l41: Ensure firmware/tuning pairs are always loaded
config: x86_64-randconfig-161-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291331.0JUUQnPT-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309291331.0JUUQnPT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309291331.0JUUQnPT-lkp@intel.com/

smatch warnings:
sound/pci/hda/cs35l41_hda.c:304 cs35l41_request_firmware_files() error: double free of '*wmfw_filename'

vim +304 sound/pci/hda/cs35l41_hda.c

2e81e1fffd53ba Vitaly Rodionov 2022-06-30  238  static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  239  					  const struct firmware **wmfw_firmware,
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  240  					  char **wmfw_filename,
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  241  					  const struct firmware **coeff_firmware,
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  242  					  char **coeff_filename)
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  243  {
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  244  	int ret;
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  245  
cd40dad2ca9196 Stefan Binding  2023-02-13  246  	if (cs35l41->speaker_id > -1) {
cd40dad2ca9196 Stefan Binding  2023-02-13  247  		ret = cs35l41_request_firmware_files_spkid(cs35l41, wmfw_firmware, wmfw_filename,
63f4b99f0089a9 Stefan Binding  2022-06-30  248  							   coeff_firmware, coeff_filename);
cd40dad2ca9196 Stefan Binding  2023-02-13  249  		goto out;
cd40dad2ca9196 Stefan Binding  2023-02-13  250  
cd40dad2ca9196 Stefan Binding  2023-02-13  251  	}
63f4b99f0089a9 Stefan Binding  2022-06-30  252  
bb6eb621f522d1 Stefan Binding  2022-06-30  253  	/* try cirrus/part-dspN-fwtype-sub<-ampname>.wmfw */
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  254  	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
bb6eb621f522d1 Stefan Binding  2022-06-30  255  					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
63f4b99f0089a9 Stefan Binding  2022-06-30  256  					    cs35l41->amp_name, -1, "wmfw");
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  257  	if (!ret) {
bb6eb621f522d1 Stefan Binding  2022-06-30  258  		/* try cirrus/part-dspN-fwtype-sub<-ampname>.bin */
cd40dad2ca9196 Stefan Binding  2023-02-13  259  		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
cd40dad2ca9196 Stefan Binding  2023-02-13  260  						    CS35L41_FIRMWARE_ROOT,
cd40dad2ca9196 Stefan Binding  2023-02-13  261  						    cs35l41->acpi_subsystem_id, cs35l41->amp_name,
cd40dad2ca9196 Stefan Binding  2023-02-13  262  						    -1, "bin");
cd40dad2ca9196 Stefan Binding  2023-02-13  263  		goto out;
bb6eb621f522d1 Stefan Binding  2022-06-30  264  	}
bb6eb621f522d1 Stefan Binding  2022-06-30  265  
bb6eb621f522d1 Stefan Binding  2022-06-30  266  	/* try cirrus/part-dspN-fwtype-sub.wmfw */
bb6eb621f522d1 Stefan Binding  2022-06-30  267  	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
bb6eb621f522d1 Stefan Binding  2022-06-30  268  					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
63f4b99f0089a9 Stefan Binding  2022-06-30  269  					    NULL, -1, "wmfw");
bb6eb621f522d1 Stefan Binding  2022-06-30  270  	if (!ret) {
bb6eb621f522d1 Stefan Binding  2022-06-30  271  		/* try cirrus/part-dspN-fwtype-sub<-ampname>.bin */
bb6eb621f522d1 Stefan Binding  2022-06-30  272  		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
bb6eb621f522d1 Stefan Binding  2022-06-30  273  						    CS35L41_FIRMWARE_ROOT,
bb6eb621f522d1 Stefan Binding  2022-06-30  274  						    cs35l41->acpi_subsystem_id,
63f4b99f0089a9 Stefan Binding  2022-06-30  275  						    cs35l41->amp_name, -1, "bin");
bb6eb621f522d1 Stefan Binding  2022-06-30  276  		if (ret)
bb6eb621f522d1 Stefan Binding  2022-06-30  277  			/* try cirrus/part-dspN-fwtype-sub.bin */
cd40dad2ca9196 Stefan Binding  2023-02-13  278  			ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
bb6eb621f522d1 Stefan Binding  2022-06-30  279  							    CS35L41_FIRMWARE_ROOT,
cd40dad2ca9196 Stefan Binding  2023-02-13  280  							    cs35l41->acpi_subsystem_id, NULL, -1,
cd40dad2ca9196 Stefan Binding  2023-02-13  281  							    "bin");
bb6eb621f522d1 Stefan Binding  2022-06-30  282  	}
bb6eb621f522d1 Stefan Binding  2022-06-30  283  
cd40dad2ca9196 Stefan Binding  2023-02-13  284  out:
cd40dad2ca9196 Stefan Binding  2023-02-13  285  	if (!ret)
cd40dad2ca9196 Stefan Binding  2023-02-13  286  		return 0;
cd40dad2ca9196 Stefan Binding  2023-02-13  287  
cd40dad2ca9196 Stefan Binding  2023-02-13  288  	/* Handle fallback */
cd40dad2ca9196 Stefan Binding  2023-02-13  289  	dev_warn(cs35l41->dev, "Falling back to default firmware.\n");
cd40dad2ca9196 Stefan Binding  2023-02-13  290  
cd40dad2ca9196 Stefan Binding  2023-02-13  291  	release_firmware(*wmfw_firmware);
cd40dad2ca9196 Stefan Binding  2023-02-13  292  	kfree(*wmfw_filename);

Freed here.

cd40dad2ca9196 Stefan Binding  2023-02-13  293  
bb6eb621f522d1 Stefan Binding  2022-06-30  294  	/* fallback try cirrus/part-dspN-fwtype.wmfw */
bb6eb621f522d1 Stefan Binding  2022-06-30  295  	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
63f4b99f0089a9 Stefan Binding  2022-06-30  296  					    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "wmfw");

Assume this fails.

cd40dad2ca9196 Stefan Binding  2023-02-13  297  	if (!ret)

Better to flip this around:

	if (ret)
		return ret;

bb6eb621f522d1 Stefan Binding  2022-06-30  298  		/* fallback try cirrus/part-dspN-fwtype.bin */
cd40dad2ca9196 Stefan Binding  2023-02-13  299  		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
63f4b99f0089a9 Stefan Binding  2022-06-30  300  						    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "bin");
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  301  
cd40dad2ca9196 Stefan Binding  2023-02-13  302  	if (ret) {
cd40dad2ca9196 Stefan Binding  2023-02-13  303  		release_firmware(*wmfw_firmware);
cd40dad2ca9196 Stefan Binding  2023-02-13 @304  		kfree(*wmfw_filename);

The zero day bot doesn't have cross function analysis so the
kfree(*wmfw_filename); warning is a false positive, but the second
release_firmware() is a double free if the kasprintf() in
cs35l41_request_firmware_file() fails.  You would have to get pretty
unlucky to hit this bug.

cd40dad2ca9196 Stefan Binding  2023-02-13  305  		dev_warn(cs35l41->dev, "Unable to find firmware and tuning\n");
cd40dad2ca9196 Stefan Binding  2023-02-13  306  	}
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  307  	return ret;
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  308  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

