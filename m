Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC683CDC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 06:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706767656; cv=none; b=qBqzrelK53kkjxAeSAsrIRtdLlSLTu4+FkfMVl2PtPhuDKY7sw95CJ+aYQMq2BvjK8Eo2913av+eOTHii06AgsSNl1aYQ5RbQnEQoq2FqZOwQXPTcQXYJRTIMKTww0YN9H3N4jrA1GBaP4dwllWE4TDndZWLTzsZQWMo3iRrDf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706767656; c=relaxed/simple;
	bh=btyoLan4DZL/fR6kCyTfmdeAIQy5NEIu/y+E4JnB20s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dXoef8+U7f3bvQh/edyEEVWh3QxId5WYVeD5zRvaP0faqxTSnt8vVYplOnLXVgt72wBNyx5tYQHCaWbOLTBQkLPGb/NpIhgWxdst2ZGUa9Qb3dP1FvRypygreHPpx9dLiR4gymUX3zmbnyyDXt7pJCzuupnxpbwfkQjFBajeXF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UexocF1d; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UexocF1d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706767654; x=1738303654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=btyoLan4DZL/fR6kCyTfmdeAIQy5NEIu/y+E4JnB20s=;
  b=UexocF1dYxAa4SStY0ITSS48Ebze/cs6eRuTuYxC6ipHcU/jKjDeaP2P
   q05AASMB8SbUwhQzN0oGwdJ82gbRGlJEQXa2N/j2ecNMjH/8n6by/6t20
   AlcFaUNWsDtCoWXNC6go54ujcoPIIbJs/AeT9O23lbn9rMdDDjN6674wz
   GrcOpksM7z4yN5jZFvvmhf3lyHVmzZb1JQrC4PoXSbligE7rGZFU7Q+ey
   D7N26f5/H5+fCcAuNSzQS8pFKhwOyzIenxXoZSHCjKstPDs14At5HZSGK
   gffQbx7QB8EZiHCp9p3xjp9mZP2t38It1em4kC5huSAmfjGwKCNy3/qok
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3680493"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="3680493"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 22:07:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="912032517"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="912032517"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Jan 2024 22:07:31 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVQET-0002Qg-04;
	Thu, 01 Feb 2024 06:07:29 +0000
Date: Thu, 1 Feb 2024 14:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Alexandru Ardelean <ardeleanalex@gmail.com>
Subject: [nsa:dev/iio-backend-axi-dds-test 15/20]
 drivers/iio/buffer/industrialio-buffer-dmaengine.c:293: warning: Function
 parameter or member 'dir' not described in 'devm_iio_dmaengine_buffer_setup'
Message-ID: <202402011453.TlJkCXcT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux dev/iio-backend-axi-dds-test
head:   56a0faf5df7548936623a26c728ff3f0e970ef6a
commit: e174cec7cad7fea60912ce9deeace5b3c7a052d9 [15/20] iio: buffer-dmaengine: Support specifying buffer direction
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240201/202402011453.TlJkCXcT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402011453.TlJkCXcT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402011453.TlJkCXcT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/buffer/industrialio-buffer-dmaengine.c:293: warning: Function parameter or member 'dir' not described in 'devm_iio_dmaengine_buffer_setup'


vim +293 drivers/iio/buffer/industrialio-buffer-dmaengine.c

a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  277  
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  278  /**
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  279   * devm_iio_dmaengine_buffer_setup() - Setup a DMA buffer for an IIO device
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  280   * @dev: Parent device for the buffer
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  281   * @indio_dev: IIO device to which to attach this buffer.
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  282   * @channel: DMA channel name, typically "rx".
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  283   *
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  284   * This allocates a new IIO buffer with devm_iio_dmaengine_buffer_alloc()
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  285   * and attaches it to an IIO device with iio_device_attach_buffer().
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  286   * It also appends the INDIO_BUFFER_HARDWARE mode to the supported modes of the
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  287   * IIO device.
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  288   */
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  289  int devm_iio_dmaengine_buffer_setup(struct device *dev,
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  290  				    struct iio_dev *indio_dev,
e174cec7cad7fea Nuno Sa            2024-01-26  291  				    const char *channel,
e174cec7cad7fea Nuno Sa            2024-01-26  292  				    enum iio_buffer_direction dir)
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15 @293  {
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  294  	struct iio_buffer *buffer;
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  295  
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  296  	buffer = devm_iio_dmaengine_buffer_alloc(indio_dev->dev.parent,
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  297  						 channel);
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  298  	if (IS_ERR(buffer))
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  299  		return PTR_ERR(buffer);
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  300  
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  301  	indio_dev->modes |= INDIO_BUFFER_HARDWARE;
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  302  
e174cec7cad7fea Nuno Sa            2024-01-26  303  	buffer->direction = dir;
e174cec7cad7fea Nuno Sa            2024-01-26  304  
ee708e6baacd3af Alexandru Ardelean 2021-02-15  305  	return iio_device_attach_buffer(indio_dev, buffer);
a02c09e42b3ed6c Alexandru Ardelean 2021-02-15  306  }
dc6184a0ea96934 Nuno Sa            2024-01-23  307  EXPORT_SYMBOL_NS_GPL(devm_iio_dmaengine_buffer_setup, IIO_DMAENGINE_BUFFER);
e0fcca9fbd99e95 Alexandru Ardelean 2020-03-24  308  

:::::: The code at line 293 was first introduced by commit
:::::: a02c09e42b3ed6cefae671e302835f1f04bf474e iio: buffer-dma,adi-axi-adc: introduce devm_iio_dmaengine_buffer_setup()

:::::: TO: Alexandru Ardelean <alexandru.ardelean@analog.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
