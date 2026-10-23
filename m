Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739015;
	b=J8W4rdoroHbg2Oh0VsT4kHYpHtDSkyPa5PhlAl+/7a0U4Sxhhbdq9TCfLO3GxRdfAtft
	 ifQ2K4Ao55QFkIiFqDavHGiDp1kkIpYZ1VJfBe7AYRD5K8zml6lUaeV16MWeBi+gWHqyo
	 EdKnsBvOLPgdaUbxGmpGWnHzUYyp9S7iTONreHd+tw/fNBlGmW+SFXvmfYAYNgKQkvsFH
	 Y4a8Jbguf3gQf1JODLn6P707qitrvxEQT7NO9IMI+RZIcn+Dd1gq8zYRh9uH8h/S8DL0Q
	 ZG/WfWikP/fWFV6a3i/VDq5QiD9QOPuTF+PJLybYq4UVXvO3Trkuag9Zzo0ykDHgYAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=JS9yRa3gsYqtIw0fjP85MFyLdkCaMUM9T+pQZ7zRxjI=;
	b=kPcVaI3ZMfGqrAbIZZpsOAg8m3twVHMf1Ahav2b/NMrOWX0NRyewf+SxRaMV7AQQfx8g
	 NVvI7hgleiPy+FUDn9tXupXAMNc6j5NdyTDlG62WlhL1QD7OizY7TmtPBOECbcEYwxZKl
	 CVQD4W20CIzIZ/F7nSUVgj74TcC8qEJwKk5/CqKf+JYwbsCwh+tf3OMJBFf/ZBboaoVvQ
	 20yXxuiYHW8+pcwZTIHx9Au+6RVW51EYF1WUxeRuQgNpKcGEXSkxxr8vm8Yq286KNTe9+
	 JDn4yrl+SjjDcMQ2MGRqU/8qxGKy9FolMX4qKXnIGsaKKQVtNnBWK6UnZVHXX9/cbZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PzNA9ozi;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB7960A263A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 07:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AB7960A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PzNA9ozi
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e04773687so138594f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 00:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739013; x=1793343813; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JS9yRa3gsYqtIw0fjP85MFyLdkCaMUM9T+pQZ7zRxjI=;
        b=PzNA9oziT+z5Up+WJACIphspl2lRzvN9sCEDQiqKcx0bAmxtCXWPflltFiyhGvNn3j
         72Dq/TM2E7re6hCca1aHJvWGwzy35c1C+fv0sdfKghA+dkZRAMAAnUawBc0VTVGfFuvs
         GQ/eCWEaM/GD/DWhm15ckko+KrvJCSdEHS87IgfQJAVmQs9M4PZJLY6YnkiQTbYTWDMC
         /r6dVe28rG1S9j+P8aaYPVQOvEA6md1P8dk16MFFkmXo/gPCVpZetLHtZDThU03EwSNV
         0hGZx3cj35/rlbOZYolDvXcdmI2hWlqzW6hZ17C1W2JMbZCJrBANqGPjQRXahB3pL1yY
         irmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739013; x=1793343813;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JS9yRa3gsYqtIw0fjP85MFyLdkCaMUM9T+pQZ7zRxjI=;
        b=zbE00FM6XMbAxdT3hc6Bq6+uBDJ0tg3ATuORi8p6gsSirD2wUdXafvBotY7mU54BE6
         oINgLCx9H0G96mfjFJB8QZ8J7Q3lQZgFUXNhwhHNG8anEJJ5Uo1DtHYh7I3VS+opsJP2
         3CkiSyCMGn5123EopqAR/lLKBNf8fdhl+qIkOj2YfB8Zdx6fI35lBIygYDk7UgLJBh/N
         iW4110NEQueYnCRoWMIawBqW7Kfufy+BEoeabjM4TAwnlLKZtLzJixl5sH85H7dWLKjF
         VG0rYgaR0DK+jt5ZwKrFlN2ItvDv0aRDkE7Gi9ZGa87KlBwLZ+s7DAaSqLyeH/RylDMR
         KZRg==
X-Forwarded-Encrypted: i=1; AKwUvByhFFyHtav13it8CcNGDdxxT2+lvy+3NE6DGGZ2CSx6oYqTQZT62t61SceIO4hGeuV7P+zunntYM12Jb3of@lists.linux.dev
X-Gm-Message-State: AFq9FYJKnzcLRy1OzCq+7J3clxcqE5IaRjguLE6vgT5sFUeTShekn08z
	IiyEavcquILpj5SOx6FPKruuFMWjTMcHO2ldxGO8+8uD7Xh+8iFjbgyN
X-Gm-Gg: AYBFou2RHojABGTJIxv+LPngP/RQXqVgoIoGuUsoONwKAbwvX7CSzdwkyFHg6UJcPxH
	g0953G4ssKdU0rr6LYIgiKXcLpgU4jawcmK0O+uQs9aqRU2MzndybDfbRKAo0sI0M64+Y6bzPpm
	B8ewUilFxGF7r61Eg55yHclxvAJVdA1xCBz+Bexi+8ZdMxfFVwuIp8du99jN0dNPkI/bVrlOFJV
	vJpsd42OAeZbH/L9wtb9aBDs71RF1IRqLV3YD9d9tWh5VuoO7XCfzJ1cXrEXpCoLv0i6dsAxc3F
	H8pIMiKTBi4WViqDJ/PRd2s5T8X9Rc4qvP57vfpp/7ZiCTKG/+htaAEUIzz9REq0Qo9OP7aEySm
	K06h+Nli5xUHnXp6sqArZ97WGUMLgcACCu/rDvEJ46qjFtAVhS0QRdWc2Lo9tQRn5ONzJmrwLJD
	kqfZu2X2/aaWgVrEurv4hPEmMQz8eHfTcW5ybZ7aFURq7ef+kj+yvxf0qWFTrU91oIORSBghJmA
	5Liicj2YIontK7j0Fk8G3ij8yaniCr9XpDu3R9lPsUpmZA3d70RluteiJcLWjnriGMV1b6uGQ==
X-Received: by 2002:a05:600c:5251:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4a216558881mr8928145e9.0.1792739013137;
        Fri, 23 Oct 2026 00:03:33 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2119c5885sm41514625e9.0.2026.10.23.00.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:03:31 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:03:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 12/12] fs/smb/client/cifsacl.c:1601
 id_mode_to_cifs_acl() warn: variable dereferenced before IS_ERR check
 'tlink' (see line 1598)
Message-ID: <202610230008.zv5aQbKX-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   25ff308d0682f31e095c4a1d5fa5f2cfb081a7d3
commit: 5f36890d650ca9fb02072ea42f7699b8ffdff75e [12/12] fs/smb/client: implement chmod() for SMB3 POSIX Extensions
config: i386-randconfig-2200-20261022 (https://download.01.org/0day-ci/archive/20261023/202610230008.zv5aQbKX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610230008.zv5aQbKX-lkp@intel.com/

smatch warnings:
fs/smb/client/cifsacl.c:1601 id_mode_to_cifs_acl() warn: variable dereferenced before IS_ERR check 'tlink' (see line 1598)

vim +/tlink +1601 fs/smb/client/cifsacl.c

a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar              2011-10-13  1582  int
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N                  2020-08-17  1583  id_mode_to_cifs_acl(struct inode *inode, const char *path, __u64 *pnmode,
8abf2775dd425e fs/cifs/cifsacl.c       Eric W. Biederman               2013-02-06  1584  			kuid_t uid, kgid_t gid)
953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1585  {
953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1586  	int rc = 0;
a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar              2011-10-13  1587  	int aclflag = CIFS_ACL_DACL; /* default flag to set */
cce246ee5f3c7f fs/cifs/cifsacl.c       Steve French                    2008-04-09  1588  	__u32 secdesclen = 0;
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1589  	__u32 nsecdesclen = 0;
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1590  	__u32 dacloffset = 0;
298e73ac323a2b fs/smb/client/cifsacl.c ChenXiaoSong                    2024-08-22  1591  	struct smb_acl *dacl_ptr = NULL;
386660bd303ec1 fs/smb/client/cifsacl.c ChenXiaoSong                    2024-08-22  1592  	struct smb_ntsd *pntsd = NULL; /* acl obtained from server */
386660bd303ec1 fs/smb/client/cifsacl.c ChenXiaoSong                    2024-08-22  1593  	struct smb_ntsd *pnntsd = NULL; /* modified acl to be sent to server */
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1594  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1595  	struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
ecdcf622eb74b5 fs/cifs/cifsacl.c       Joe Perches via samba-technical 2017-05-07  1596  	struct smb_version_operations *ops;
a6603398278480 fs/cifs/cifsacl.c       Steve French                    2020-06-12  1597  	bool mode_from_sid, id_from_sid;
5f36890d650ca9 fs/smb/client/cifsacl.c Ralph Boehme                    2024-11-14 @1598  	bool posix = tlink_tcon(tlink)->posix_extensions;
                                                                                                                        ^^^^^
Dereference

3970acf7ddb9aa fs/cifs/cifsacl.c       Boris Protopopov                2020-12-18  1599  	const u32 info = 0;
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1600  
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02 @1601  	if (IS_ERR(tlink))
                                                                                                           ^^^^^
Checked too late.

83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1602  		return PTR_ERR(tlink);
ecdcf622eb74b5 fs/cifs/cifsacl.c       Joe Perches via samba-technical 2017-05-07  1603  
ecdcf622eb74b5 fs/cifs/cifsacl.c       Joe Perches via samba-technical 2017-05-07  1604  	ops = tlink_tcon(tlink)->ses->server->ops;
953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1605  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

