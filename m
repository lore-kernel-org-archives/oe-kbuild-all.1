Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523F74405
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 18:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717959508; cv=none; b=KkTTd8i5rMr0OuvoHAKgRmWotJbbVFy+rcVPSz1IiTZU/bBmHKFNITS2n68/7dXld3jSXvnVkuJeO9PEJityXyhXpdwuTYL6mnqyeAJ9rtiStmJ7+enV4jIbzGovE5e5Irvf6Ax703xzht/EwGmrEL47LwBozaB7Onhs2anS1dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717959508; c=relaxed/simple;
	bh=xLZ15ZSCiNfPHKmOv1irhHS+V9w3z7/amCWYepTbvKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCug2z22RffIkQQTAwbq+VlwWzF1w0O2LgCmLH71TxqT+0O4Wxj/iBJXRyaZHeipMtIHt232JNdFZD6X/Yv2oggmhjh+C+ldy92rM3vfTlitvi+g2HZAk9LKP2T4U7T0sQgmpMeWfes0ldviP8Zalv0HAo8POp9fZnLA5Ex7UeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2w9Xnxq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2w9Xnxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717959507; x=1749495507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xLZ15ZSCiNfPHKmOv1irhHS+V9w3z7/amCWYepTbvKA=;
  b=P2w9XnxqRArhBxPE2U5dRXgN0PonCKxy14IiKmSPcW7vM2sxAOg6KGg8
   5LXvKn1zwXNgQY0wlB33mGu84b0nrFGMyxHneCVrQ+MxFSCS22yDzLIgX
   aAmivuNnpDul8EIxQUyDDEu/2pdk1QQCB531xxJfXITUISMhO8TmT6ZJL
   1d8e4K9LbwZie6O9RW7GCHkIJaS+iUvinmeW+T0La795vNGWWDO0Puoos
   3EknGHqurVv2hKITZpGBicqpCeeZyhjetNerhxVkxWtVSihdD3cERN1FS
   HDar4JAUSx+OLw2dbDAmOebHW1oJqKIa6ELvxpfBaV85961xRsUtDsrmH
   Q==;
X-CSE-ConnectionGUID: WHGMPrp/TueXhkl4VJttYw==
X-CSE-MsgGUID: qhzDeSxMTRa1ArZrfoyM+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14773333"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="14773333"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 11:58:26 -0700
X-CSE-ConnectionGUID: Nvsw0J+HS/2SU9W8nqgrwg==
X-CSE-MsgGUID: 0IzW2ipmScGx9z8A3wZhAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="70030481"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Jun 2024 11:58:24 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGNkE-0001Wb-0a;
	Sun, 09 Jun 2024 18:58:22 +0000
Date: Mon, 10 Jun 2024 02:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>,
	Kees Cook <keescook@chromium.org>,
	Ronnie Sahlberg <lsahlber@redhat.com>
Subject: [samba-ksmbd:for-next 226/600] fs/cifs/cifspdu.h:512:17: error:
 expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
Message-ID: <202406100234.NpQ5JC5V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git for-next
head:   3fe4ba20003290acf0547625cccc34db928d156e
commit: cb470770db4ecdaf46a6c4b1703889ba2d6a4b19 [226/600] cifs: Replace a couple of one-element arrays with flexible-array members
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240610/202406100234.NpQ5JC5V-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100234.NpQ5JC5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100234.NpQ5JC5V-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/cifs/cifsfs.c:32:
>> fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
--
   In file included from fs/cifs/cifsglob.h:100,
                    from fs/cifs/cached_dir.c:8:
>> fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cached_dir.c:415:6: warning: no previous prototype for 'free_cached_dir' [-Wmissing-prototypes]
     415 | void free_cached_dir(struct cached_fid *cfid)
         |      ^~~~~~~~~~~~~~~
--
   In file included from fs/cifs/cifssmb.c:26:
>> fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifssmb.c: In function 'decode_ext_sec_blob':
>> fs/cifs/cifssmb.c:381:33: error: 'union <anonymous>' has no member named 'extended_response'
     381 |         char    *guid = pSMBr->u.extended_response.GUID;
         |                                 ^
   fs/cifs/cifssmb.c:405:33: error: 'union <anonymous>' has no member named 'extended_response'
     405 |                         pSMBr->u.extended_response.SecurityBlob, count, server);
         |                                 ^
   fs/cifs/cifssmb.c: In function 'CIFSSMBNegotiate':
>> fs/cifs/cifssmb.c:516:55: error: 'union <anonymous>' has no member named 'EncryptionKey'
     516 |                 memcpy(ses->server->cryptkey, pSMBr->u.EncryptionKey,
         |                                                       ^


vim +/DECLARE_FLEX_ARRAY +512 fs/cifs/cifspdu.h

   490	
   491	#define READ_RAW_ENABLE 1
   492	#define WRITE_RAW_ENABLE 2
   493	#define RAW_ENABLE (READ_RAW_ENABLE | WRITE_RAW_ENABLE)
   494	#define SMB1_CLIENT_GUID_SIZE (16)
   495	typedef struct negotiate_rsp {
   496		struct smb_hdr hdr;	/* wct = 17 */
   497		__le16 DialectIndex; /* 0xFFFF = no dialect acceptable */
   498		__u8 SecurityMode;
   499		__le16 MaxMpxCount;
   500		__le16 MaxNumberVcs;
   501		__le32 MaxBufferSize;
   502		__le32 MaxRawSize;
   503		__le32 SessionKey;
   504		__le32 Capabilities;	/* see below */
   505		__le32 SystemTimeLow;
   506		__le32 SystemTimeHigh;
   507		__le16 ServerTimeZone;
   508		__u8 EncryptionKeyLength;
   509		__u16 ByteCount;
   510		union {
   511			/* cap extended security off */
 > 512			DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
   513			/* followed by Domain name - if extended security is off */
   514			/* followed by 16 bytes of server GUID */
   515			/* then security blob if cap_extended_security negotiated */
   516			struct {
   517				unsigned char GUID[SMB1_CLIENT_GUID_SIZE];
   518				unsigned char SecurityBlob[];
   519			} __attribute__((packed)) extended_response;
   520		} __attribute__((packed)) u;
   521	} __attribute__((packed)) NEGOTIATE_RSP;
   522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
